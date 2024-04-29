import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:serinus/serinus.dart';

/// The class FormData is used to parse multipart/form-data and application/x-www-form-urlencoded
class FormData {
  final Map<String, dynamic> _fields;
  final Map<String, UploadedFile> _files;

  /// The [FormData] constructor is used to create a [FormData] object
  const FormData(
      {Map<String, dynamic> fields = const {},
      Map<String, UploadedFile> files = const {}})
      : _fields = fields,
        _files = files;

  Map<String, dynamic> get values =>
      Map.unmodifiable({"fields": fields, "files": files});
  Map<String, dynamic> get fields => Map.unmodifiable(_fields);
  Map<String, UploadedFile> get files => Map.unmodifiable(_files);

  /// This method is used to parse the request body as a [FormData] if the content type is multipart/form-data
  static Future<FormData> parseMultipart({required HttpRequest request}) async {
    try {
      final mediaType = MediaType.parse(
          request.headers[HttpHeaders.contentTypeHeader]!.join(';'));
      final boundary = mediaType.parameters['boundary'];
      final parts = _getMultiparts(request, boundary);
      RegExp regex = RegExp('([a-zA-Z0-9-_]+)="(.*?)"');
      final fields = <String, dynamic>{};
      final files = <String, UploadedFile>{};
      await for (MimeMultipart part in parts) {
        final contentDisposition = part.headers['content-disposition'];
        if (contentDisposition == null ||
            !contentDisposition.startsWith('form-data;')) {
          continue;
        }

        final values = regex
            .allMatches(contentDisposition)
            .fold(<String, String>{}, (map, match) {
          return map..[match.group(1)!] = match.group(2)!;
        });

        final name = values['name']!;
        final fileName = values['filename'];

        if (fileName != null) {
          files[name] = UploadedFile(
            part,
            ContentType.parse(part.headers['content-type'] ?? 'text/plain'),
            fileName,
          );
          await files[name]!.readAsString();
        } else {
          final bytes =
              (await part.toList()).fold(<int>[], (p, e) => p..addAll(e));
          fields[name] = utf8.decode(bytes);
        }
      }
      return FormData(fields: fields, files: files);
    } catch (_) {
      throw NotAcceptableException();
    }
  }

  /// This method is used to parse the request body as a [FormData] if the content type is application/x-www-form-urlencoded
  factory FormData.parseUrlEncoded(String body) {
    return FormData(fields: Uri.splitQueryString(body), files: {});
  }

  static Stream<MimeMultipart> _getMultiparts(
      HttpRequest request, String? boundary) {
    if (boundary == null) {
      throw StateError('Not a multipart request.');
    }

    return MimeMultipartTransformer(boundary).bind(request);
  }
}

/// The class [UploadedFile] is used to represent a file uploaded by the user
/// It is used to parse the file and store it in a string
/// The string can be accessed by calling the [toString] method
/// The [readAsString] method is used to parse the file and store it in the string
/// The [stream] property is used to get the stream of the file
/// The [contentType] property is used to get the content type of the file
/// The [name] property is used to get the name of the file
class UploadedFile with JsonObject {
  final ContentType contentType;
  final Stream<List<int>> stream;
  final String name;
  String _data = "";

  UploadedFile(this.stream, this.contentType, this.name);

  Future<void> readAsString() async {
    List<String> data = [];
    await for (final part in stream) {
      data.add(String.fromCharCodes(part));
    }
    _data = data.join('');
  }

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'contentType': contentType.toString(), 'data': _data};
  }
}

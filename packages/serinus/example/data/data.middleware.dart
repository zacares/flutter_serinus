import 'package:serinus/serinus.dart';

class DataMiddleware implements SerinusMiddleware{
  @override
  use(Request request, Response response, void Function() next) {
    response.headers.add("testHeader2", 100);
    next();
  }
}
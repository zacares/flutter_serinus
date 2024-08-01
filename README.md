[![Serinus Logo][logo_white]][repo_link]

[![codecov](https://codecov.io/gh/francescovallone/serinus/branch/main/graph/badge.svg?token=A2337C1XGG)](https://codecov.io/gh/francescovallone/serinus)
[![Pub Likes](https://img.shields.io/pub/likes/serinus?style=flat&logo=dart&label=Package%20likes&color=%23FF9800)](https://pub.dev/packages/serinus/score)
[![Pub Points](https://img.shields.io/pub/points/serinus?label=Package%20points&logo=dart)](https://pub.dev/packages/serinus/score)
[![Pub Version](https://img.shields.io/pub/v/serinus?color=green&label=Latest%20Version&logo=dart)](https://pub.dev/packages/serinus)
[![popularity](https://img.shields.io/pub/popularity/serinus?logo=dart&label=Package%20Popularity)](https://pub.dev/packages/serinus/score)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/francescovallone/serinus/serinus_tests.yml?logo=dart&label=Tests)
[![Discord](https://img.shields.io/discord/1099781506978807919?logo=discord&logoColor=white)](https://discord.gg/FPwH2fEUVF)

Serinus is a framework written in Dart for building efficient and scalable server-side applications.

# Getting Started

## Packages

| Package | Version |
| ------- | ------- |
| [serinus](https://pub.dev/packages/serinus) | [![Pub Version](https://img.shields.io/pub/v/serinus?color=green&logo=dart)](https://pub.dev/packages/serinus) |
| [serinus_cli](https://pub.dev/packages/serinus_cli) | [![Pub Version](https://img.shields.io/pub/v/serinus_cli?color=green&logo=dart)](https://pub.dev/packages/serinus_cli) |
| [serinus_config](https://pub.dev/packages/serinus_config) | [![Pub Version](https://img.shields.io/pub/v/serinus_config?color=green&logo=dart)](https://pub.dev/packages/serinus_config) |
| [serinus_swagger](https://pub.dev/packages/serinus_swagger) | [![Pub Version](https://img.shields.io/pub/v/serinus_swagger?color=green&logo=dart)](https://pub.dev/packages/serinus_swagger) |
| [serinus_cors](https://pub.dev/packages/serinus_cors) | [![Pub Version](https://img.shields.io/pub/v/serinus_cors?color=green&logo=dart)](https://pub.dev/packages/serinus_cors) |
| [serinus_rate_limiter](https://pub.dev/packages/serinus_rate_limiter) | [![Pub Version](https://img.shields.io/pub/v/serinus_rate_limiter?color=green&logo=dart)](https://pub.dev/packages/serinus_rate_limiter) |
| [serinus_serve_static](https://pub.dev/packages/serinus_serve_static) | [![Pub Version](https://img.shields.io/pub/v/serinus_serve_static?color=green&logo=dart)](https://pub.dev/packages/serinus_serve_static) |

## Installation

To install Serinus you can use the following command:

```bash
dart pub global activate serinus_cli
```

## Create a new project

```bash
serinus create <project_name>
```

## Run the project

```bash
cd <project_name>
serinus run
```

By default the server will run on port 3000 and will listen for requests on localhost. You can change these settings modifying the file where you have defined the application (by default this file is `lib/main.dart`) or by passing the `--port` and `--host` flags to the `run` command:

```bash
serinus run --port=8080 --host=localhost
```

You can also start the application in development mode adding the `--dev` flag to the command:

```bash
serinus run --dev
```

In development mode the server will automatically restart when you change the source code.

## Documentation

You can find the documentation [here][documentation_link].

# License

Serinus is licensed under the MIT license. See the [LICENSE](LICENSE) file for more info.

# Contributing

If you want to contribute to Serinus, please read the [CONTRIBUTING](CONTRIBUTING.md) file.

[repo_link]: https://github.com/francescovallone/serinus
[documentation_link]: https://docs.serinus.app
[logo_white]: https://raw.githubusercontent.com/francescovallone/serinus/main/packages/serinus/assets/serinus-logo-long.png
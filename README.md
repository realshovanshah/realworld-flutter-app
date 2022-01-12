# ![RealWorld Example App](logo.png)

> ### [Flutter] codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld) spec and API.


### [Demo](https://demo.realworld.io/)&nbsp;&nbsp;&nbsp;&nbsp;[RealWorld](https://github.com/gothinkster/realworld)


This codebase was created to demonstrate a fully fledged fullstack application built with **[Flutter]** including CRUD operations, authentication, routing, pagination, and more.

We've gone to great lengths to adhere to the **[Flutter]** community styleguides & best practices.

For more information on how to this works with other frontends/backends, head over to the [RealWorld](https://github.com/gothinkster/realworld) repo.


![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

# How it works

  
### State Management: [Flutter Bloc](https://www.bloclibrary.dev)

### Packages:

We use the following packages for increased productivity and better architecture. We also encourage creating your own packages for better code separation and reuse across multiple projects. eg. UI Package (todo)

- **[Freezed](https://pub.dev/packages/freezed)** & **[Json Serializable](https://pub.dev/packages/json_serializable)**: For auto generating data and sealed classes including `toJson` `fromJson` `copyWith` & `blocs`.
- **[Get It](https://pub.dev/packages/get_it)** & **[Injectable](https://pub.dev/packages/injectable)** : As a service locator & for dependency injection.
- **[Flutter Form Builder](https://pub.dev/packages/flutter_form_builder)** : Perfect for coding forms asap.
- **[Bloc Suite](https://pub.dev/publishers/bloclibrary.dev/packages)** : The one stop solution for handling large states and consistent code.


### Project Structure:

```shell
 📂 lib
    ├─ 📂 app
    │  └─ app.dart
    ├─ 📂 config
    │   ├─ 📂 constants
    │   ├─ 📂 logger
    │   ├─ 📂 di
    │   └─ 📂 router
    ├─ 📂 core
    │   ├─ 📂 network
    │   ├─ 📂 db
    │   └─ 📂 exceptions
    ├─ 📂 features
    │   └─ 📂 sample_feature
    │       ├─ 📂 data
    │       │  ├─ 📂 local
    │       │  │   └─ remote_feature_datasource.dart
    │       │  │   └─ local.dart
    │       │  ├─ 📂 remote
    │       │  │   └─ remote_feature_datasource.dart
    │       │  │   └─ remote.dart
    │       │  ├─ 📂 repository
    │       │  │   └─ feature_repository_impl.dart
    │       │  │   └─ remote.dart
    │       │  ├─ 📂 dto
    │       │  │   └─ feature_dto.dart
    │       │  │   └─ dto.dart
    │       ├─ 📂 domain
    │       │  ├─ 📂 entity
    │       │  │   └─ feature_entity.dart
    │       │  │   └─ feature_entity.g.dart
    │       │  │   └─ entity.dart
    │       │  └─ 📂 repository
    │       │      └─ feature_repository.dart
    │       │      └─ feature_repository.dart
    │       │      └─ repository.dart
    │       └─ 📂 presentation
    │          ├─ 📂 state 
    │          │   └─ feature_state.dart
    │          │   └─ state.dart
    │          ├─ 📂 view
    │          │   └─ feature_view.dart
    │          │   └─ screen.dart
    │          └─ 📂 widgets
    │              └─ feature_widget.dart
    │              └─ widgets.dart
    └─ main.dart
     
```

We prefer `folder by feature` than the traditional `folder by type` way of structuring projects. This leads to a better overall developer experience as a team and also as an individual.

When working on a new feature, the developer must follow the `sample_feature` convention shown in the above tree. [Link to the feature directory.](https://github.com/realshovanshah/realworld-flutter-app/tree/master/lib/features)


# Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Realworld Flutter works on iOS, Android, and Web._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:realworld_flutter/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

Generated by the [Very Good CLI][very_good_cli_link] 

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli


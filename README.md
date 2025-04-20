# Darty X

https://pub.dev/packages/darty_x

A collection of useful extension functions for Dart language to enhance productivity and code readability. This package provides convenient extensions that add functionality to existing Dart types without modifying their original implementation.

## Getting started

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  darty_x: ^0.0.1
```

Then import the specific extensions you need in your Dart file.

## Usage

The package is organized into categories of extensions for different Dart types. Import only what you need to keep your dependencies minimal.

```dart
import 'package:darty_x/string/string.dart'

void main() {
  final multilineStringContent = """
  * foo.
  * bar
      - baz
  * qux
  """;
  final trimmed = multilineStringContent.trimLeadingWhitespace()
}
```

Each extension is designed to be intuitive and follows Dart's standard naming conventions.

For detailed examples, see the documentation comments in the source code.

## Additional information

- Licensed under MIT
- Contributions are welcome! Feel free to submit issues or pull requests
- For more detailed documentation on specific extensions, see the API reference
- This package is compatible with both Dart and Flutter projects

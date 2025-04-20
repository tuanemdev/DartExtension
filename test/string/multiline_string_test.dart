import 'package:flutter_test/flutter_test.dart';
import 'package:dart_extension/string/multiline_string.dart';

void main() {
  final testStringContent = """
  * foo.
  * bar
      - baz
  * qux
  """;
  test('Trim leading whitespace on multiline string', () {
    expect(
      testStringContent.trimLeadingWhitespace(),
"""
* foo.
* bar
    - baz
* qux
"""
    );
  });
}

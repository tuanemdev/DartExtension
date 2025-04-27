import 'package:flutter_test/flutter_test.dart';
import 'package:darty_x/string/null_empty.dart';

void main() {
  group('NullEmptyChecker extension', () {
    test('isNullOrEmpty returns true for null string', () {
      String? nullString;
      expect(nullString.isNullOrEmpty, true);
    });

    test('isNullOrEmpty returns true for empty string', () {
      String? emptyString = '';
      expect(emptyString.isNullOrEmpty, true);
    });

    test('isNullOrEmpty returns false for non-empty string', () {
      String? nonEmptyString = 'test';
      expect(nonEmptyString.isNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns false for null string', () {
      String? nullString;
      expect(nullString.isNotNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns false for empty string', () {
      String? emptyString = '';
      expect(emptyString.isNotNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns true for non-empty string', () {
      String? nonEmptyString = 'test';
      expect(nonEmptyString.isNotNullOrEmpty, true);
    });
  });
}

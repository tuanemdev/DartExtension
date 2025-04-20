
extension MultilineStringTrimmer on String {
  /// Trims leading whitespace from each line of a multiline string.</br>
  /// Last line must contain only space and tab.</br>
  /// refer: https://github.com/dart-lang/language/issues/559
  String trimLeadingWhitespace() {
    int lastLineStart = length;
    int char = 0;
    while (lastLineStart > 0 && (char = codeUnitAt(lastLineStart - 1)) == 0x20 || char == 0x09) {
      lastLineStart--;
    }
    if (lastLineStart == 0) return "";
    StringBuffer buffer = StringBuffer();
    if (char != 0x0d && char != 0x0a) return this;
    int i = 0;
    do {
      for (var j = lastLineStart; j < length; j++) {
        if (codeUnitAt(i) != codeUnitAt(j)) return this;
        i++;
      }
      int lineStart = i;
      int char = 0;
      while ((char = codeUnitAt(i++)) != 0x0a && char != 0x0d) { }
      if (char == 0x0d && i < lastLineStart && codeUnitAt(i) == 0x0a) {
        i++;
      }
      buffer.write(substring(lineStart, i));
    } while (i < lastLineStart);
    return buffer.toString();
  }
}

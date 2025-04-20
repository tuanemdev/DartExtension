extension MultilineStringTrimmer on String {
  /// Trims leading whitespace from each line of a multiline string.</br>
  /// The last line must contain only spaces and tabs to serve as the indentation pattern.</br>
  /// See: https://github.com/dart-lang/language/issues/559
  String trimLeadingWhitespace() {
    // Find the starting position of the indentation pattern (last line)
    int lastLineStart = length;
    int char = 0;
    while (lastLineStart > 0 && (char = codeUnitAt(lastLineStart - 1)) == 0x20 || char == 0x09) {
      lastLineStart--;
    }
    if (lastLineStart == 0) return "";
    StringBuffer buffer = StringBuffer();
    if (char != 0x0d && char != 0x0a) return this;
    
    // Current position pointer in the string being processed
    int currentPosition = 0;
    do {
      // Compare the beginning of the line with the indentation pattern
      for (var indentPatternPosition = lastLineStart; indentPatternPosition < length; indentPatternPosition++) {
        if (codeUnitAt(currentPosition) != codeUnitAt(indentPatternPosition)) return this;
        currentPosition++;
      }
      
      int lineStart = currentPosition;
      int char = 0;
      while ((char = codeUnitAt(currentPosition++)) != 0x0a && char != 0x0d) { }
      if (char == 0x0d && currentPosition < lastLineStart && codeUnitAt(currentPosition) == 0x0a) {
        currentPosition++;
      }
      buffer.write(substring(lineStart, currentPosition));
    } while (currentPosition < lastLineStart);
    return buffer.toString();
  }
}

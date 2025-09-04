extension StringExtintion on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String getTwoLetters() {
    final parts = trim().split(RegExp(r"\s+"));

    if (parts.length > 1) {
      // Multiple words → take first letter of first & last word
      return (parts.first[0] + parts.last[0]).toUpperCase();
    } else {
      // Single word → take first and last character
      final word = parts.first;
      if (word.length == 1) return word.toUpperCase(); // single letter case
      return (word[0] + word[word.length - 1]).toUpperCase();
    }
  }
}

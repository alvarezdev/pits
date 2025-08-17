/// Provides extension methods for formatting and manipulating String objects.
extension StringExtensions on String? {
  /// Default empty string value
  String get empty => '';

  /// Default space string value
  String get space => ' ';

  /// Checks if the string is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Checks if the string is neither null nor empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Validates if the string is a valid email address.
  bool get isValidEmail {
    if (isNullOrEmpty) return false;
    return RegExp(RegexConstants.emailRegex).hasMatch(this!);
  }

  /// Validates if the string is an integer number.
  bool get isInteger {
    if (isNullOrEmpty) return false;
    return int.tryParse(this!) != null;
  }

  /// Validates if the string is a double (decimal) number.
  bool get isDouble {
    if (isNullOrEmpty) return false;
    return double.tryParse(this!) != null;
  }

  /// Returns the string with the first letter capitalized.
  String capitalize() {
    if (isNullOrEmpty) return this ?? empty;
    return this![0].toUpperCase() + this!.substring(1);
  }

  /// Returns the string with each word's first letter capitalized (title case).
  String toTitleCase() {
    if (isNullOrEmpty) return this ?? empty;
    return this!.split(space).map((str) => str.capitalize()).join(space);
  }

  /// Removes all whitespace characters from the string.
  String removeAllWhitespace() {
    if (isNullOrEmpty) return this ?? empty;
    return this!.replaceAll(space, empty);
  }

  /// Truncates the string to a maximum length, appending '...' if truncated.
  /// [maxLength] The maximum allowed length.
  String truncate(int maxLength) {
    if (isNullOrEmpty) return this ?? empty;
    if (this!.length <= maxLength) return this ?? empty;
    return '${this!.substring(0, maxLength)}...';
  }

  /// Masks the string, replacing characters with a mask character.
  /// [visibleChars] Number of characters to leave visible at the end.
  /// [maskChar] Character used for masking.
  String mask({int visibleChars = 4, String maskChar = '*'}) {
    if (isNullOrEmpty) return this ?? empty;
    if (this!.length <= visibleChars) return this ?? empty;
    return maskChar * (this!.length - visibleChars) +
        this!.substring(this!.length - visibleChars);
  }
}

class RegexConstants {
  /// Regular expression for validating email addresses.
  static const String emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";
  static const String linksRegex =
      r'(?:(?:https?|ftp)://)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
}

/// Custom exception class to handle various format-related errors.
class MyFormatException implements Exception {
  /// Default constructor with a generic error message
  const MyFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  /// The associated error message.
  final String message;

  /// Create a format exception from a specific error message.
  factory MyFormatException.fromMessage(String message) {
    return MyFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory MyFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const MyFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const MyFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const MyFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const MyFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const MyFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const MyFormatException('The input should be a valid numeric format.');
      // Add more cases as needed...
      default:
        return const MyFormatException();
    }
  }
}

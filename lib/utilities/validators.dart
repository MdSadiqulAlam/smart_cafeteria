class MyValidator {
  /// check empty text
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// check email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value) || value == 'mistcafe.admin@gmail.com') {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the price';
    }
    final number = num.tryParse(value);
    if (number == null || number <= 0) {
      return 'Please enter a valid price greater than 0';
    }
    return null;
  }

  static String? validateCalorie(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the calorie count';
    }
    final number = num.tryParse(value);
    if (number == null || number <= 0) {
      return 'Please enter a valid calorie count greater than 0';
    }
    return null;
  }

  static String? validateStockQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the stock quantity';
    }
    final number = int.tryParse(value);
    if (number == null || number < 0) {
      return 'Please enter a valid stock quantity (0 or greater)';
    }
    return null;
  }

  /// check password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    /// Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // // Check for uppercase letters
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter.';
    // }
    //
    // // Check for numbers
    // if (!value.contains(RegExp(r'[0-9]'))) {
    //   return 'Password must contain at least one number.';
    // }
    //
    // // Check for special characters
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'Password must contain at least one special character.';
    // }

    return null;
  }

  /// check phone
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation
    final phoneRegExp = RegExp(r'^01\d{9}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format';
    }

    return null;
  }
}

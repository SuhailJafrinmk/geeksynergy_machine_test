class InputValidator {
  static String? validateUsername(username) {
    if (username.isEmpty) {
      return 'Username is required';
    } else if (username.length < 3 || username.length > 20) {
      return 'Username must be between 3 and 20 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }


  static String? validatePassword(password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password)) {
      return 'Password must contain at least one uppercase letter, one number, and one special character';
    }
    return null;
  }

  static String? validateEmail(email) {
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePhoneNumber(phoneNumber) {
    if (phoneNumber.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }
}

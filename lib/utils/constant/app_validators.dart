mixin AppValidatorsMixin {
  bool isPasswordValid(String password) {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(password);
  }

  bool isValidEmail(String email) {
    RegExp regex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  bool isValidName(String email) {
    RegExp regex =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return regex.hasMatch(email);
  }

  bool isValidPhone(String email) {
    RegExp regex = RegExp(r"^\+?0[0-9]{10}$");
    return regex.hasMatch(email);
  }

  bool isNotNull(String? text) {
    return text!.isEmpty;
  }
}

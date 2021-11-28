mixin EmailValidatorMixin {
  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email field is empty';
    } else if (!email.contains('@')) {
      return 'Email is not valid';
    }
    return '';
  }
}

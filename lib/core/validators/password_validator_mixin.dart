mixin PasswordValidatorMixin {
  String validatePassword(String email) {
    if (email.isEmpty) {
      return 'Password field is empty';
    }
    return '';
  }
}

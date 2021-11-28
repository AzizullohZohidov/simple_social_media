mixin ConfirmPasswordValidatorMixin {
  String checkPasswordMatch(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return '';
  }
}

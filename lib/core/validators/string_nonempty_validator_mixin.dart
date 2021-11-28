mixin StringNonemptyValidatorMixin {
  String isStringNotEmpty(String str) {
    if (str.isEmpty) {
      return 'Field is empty';
    }
    return '';
  }
}

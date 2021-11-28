mixin StringNonemptyValidatorMixin {
  bool isStringNotEmpty(String str) {
    if (str.isEmpty) {
      return false;
    }
    return true;
  }
}

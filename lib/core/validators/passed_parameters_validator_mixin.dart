mixin PassedParametersValidatorMixin {
  bool areParametrsValid(List<String> param) {
    int errorLength = 0;
    for (String p in param) {
      errorLength += p.length;
    }
    if (errorLength > 0) {
      return false;
    } else {
      return true;
    }
  }
}

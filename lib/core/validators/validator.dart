String? emptyValidator(String? val) {
  if (val == null || val.isEmpty) {
    return 'Required field';
  }
  return null;
}

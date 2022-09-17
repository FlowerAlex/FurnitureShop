extension StringExtensions on String? {
  String swapIfEmpty({String swapValue = '-'}) {
    final val = this;
    if (val == null || val.isEmpty) {
      return swapValue;
    } else {
      return val;
    }
  }
}

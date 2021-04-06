extension StringEx1 on String? {
  bool get isNotNullOrEmpty => this?.isNotEmpty == false;
}

extension StringEx2 on String {
  bool containsIgnoreCase(String? other, [int startIndex = 0]) {
    if (other == null) {
      return true;
    }
    return toLowerCase().contains(other.toLowerCase(), startIndex);
  }
}

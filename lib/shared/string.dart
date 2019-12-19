extension StringEx on String {
  bool get isNotNullOrEmpty => this != null && isNotEmpty;
  bool containsIgnoreCase(String other, [int startIndex = 0]) {
    if (other == null) {
      return true;
    }
    return toLowerCase().contains(other.toLowerCase(), startIndex);
  }
}

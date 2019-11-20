String fromEnum(Object enumeration) {
  assert(enumeration != null, 'Enumeration object cannot be null');
  return enumeration.toString().split('.').last;
}

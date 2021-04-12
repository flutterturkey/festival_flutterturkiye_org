extension StringFormatter on String {
  String format() => replaceAll('<br>', '\n');
}

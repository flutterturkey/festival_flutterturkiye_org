extension DateExtension on DateTime {
  bool compareDateTo(DateTime dateTime) =>
      year == dateTime.year && month == dateTime.month && day == dateTime.day;
}

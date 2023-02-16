import 'package:intl/intl.dart';

// ...

String formatDate(DateTime date) {
  return DateFormat('MMMM d, y').format(date);
}

// convert Datetime to unix
int dateTimeToUnix(String value) {
  final dateTime = DateTime.parse(value);
  return dateTime.millisecondsSinceEpoch ~/ 1000;
}

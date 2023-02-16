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

// write documentation for this cpde

String convertToDDMMYYYY(DateTime timestamp) {
  final formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(timestamp);
}


DateTime convertToTimestamp(String dateStr) {
  final formatter = DateFormat('dd/MM/yyyy');
  return formatter.parse(dateStr);
}

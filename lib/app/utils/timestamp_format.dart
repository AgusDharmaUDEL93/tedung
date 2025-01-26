import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  DateFormat formatter = DateFormat('d/M/yy');

  // Format the DateTime to a string
  return formatter.format(dateTime);
}

String formatTimestampLong(Timestamp timestamp) {
  final dateFormat = DateFormat("d MMMM yyyy, HH.mm");
  return dateFormat.format(timestamp.toDate());
}

String formatTimestampDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  DateFormat formatter = DateFormat('d MMMM yyyy');

  return formatter.format(dateTime);
}

String formatTimestampTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  DateFormat formatter = DateFormat('HH.mm');

  return formatter.format(dateTime);
}

String formatTimestampGoogleCalendar(Timestamp timestamp) {
  // Convert Firebase Timestamp to DateTime
  DateTime dateTime = timestamp.toDate();

  // Format DateTime into string (YYYYMMDDTHHMMSS)
  return DateFormat('yyyyMMddTHHmmss').format(dateTime);
}

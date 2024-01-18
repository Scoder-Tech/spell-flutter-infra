import 'package:intl/intl.dart';

extension DateParsing on DateTime {
  String dateTimeToString(String outputFormat) {
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(this.toLocal());
  }

  String dateTimeToStringUTC(String outputFormat) {
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(this);
  }

  String formatDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(dateTime);
  }

  DateTime formatDateToDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.parse(outputDateFormat.format(dateTime));
  }
}

extension DateStringParsing on String {
  DateTime formatStringToDate(String outputFormat) {
    DateTime dateTime = DateTime.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.parse(outputDateFormat.format(dateTime));
  }

  DateTime formatStringDateToDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.parse(outputDateFormat.format(dateTime));
  }
}

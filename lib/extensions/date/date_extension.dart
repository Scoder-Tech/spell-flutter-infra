import 'package:intl/intl.dart';

extension DateParsing on DateTime {
  String dateTimeToString(String outputFormat) {
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(toLocal());
  }

  String dateTimeToStringUTC(String outputFormat) {
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(this);
  }

  String formatDate(String outputFormat) {
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(this);
  }

  DateTime formatDateToDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.parse(outputDateFormat.format(dateTime));
  }

  String getMonthName() {
    int monthIndex = month - 1;
    return monthNamesPt[monthIndex];
  }
}

extension DateStringParsing on String {
  DateTime formatStringToDate(String outputFormat) {
    DateTime dateTime = DateTime.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.parse(outputDateFormat.format(dateTime));
  }

  DateTime toDate() {
    List<String> dateParts = split('-');

    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);
    return DateTime(year, month, day);
  }

  DateTime formatStringDateToDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.parse(outputDateFormat.format(dateTime));
  }
}

List<String> monthNamesPt = [
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];

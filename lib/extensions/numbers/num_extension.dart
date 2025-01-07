import 'package:intl/intl.dart';

extension NumToString on num? {
  String? toStringBRL() {
    if (this == null) return null;

    return this!.toStringAsFixed(2).replaceAll('.', ',');
  }

  String? toStringCurrencyBRL({
    String newPattern = '#,##0.00'
  }) {
    if (this == null) return null;

    var dotsFormatter = NumberFormat(newPattern, 'pt_BR');

    return dotsFormatter.format(this);
  }
}

extension NumberFormatExtension on num {
  String formatWithThousandsSeparator() {
    var milharDotsFormatter = NumberFormat('#,##0.00', 'pt_BR');
    return milharDotsFormatter.format(this);
  }

  String formatWithThousandsSeparatorWithoutComma() {
    var milharDotsFormatter = NumberFormat('#,##0', 'pt_BR');
    return milharDotsFormatter.format(this);
  }
}

extension ToNumExtension on String {
  num? toNum() {
    if (this == '') {
      return null;
    }

    RegExp regex = RegExp(r'[^0-9.]');

    return num.tryParse(
        replaceAll('.', '').replaceAll(',', '.').replaceAll(regex, '')
    );
  }

  double currencyToNum() {
    return double.parse(replaceAll('B\$ ', '').replaceAll(',', ''));
  }
}
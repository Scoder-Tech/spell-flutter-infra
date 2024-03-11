import 'package:intl/intl.dart';

extension ToNumExtension on String {
  num? toNum() {
    if (this == '') {
      return null;
    }

    RegExp regex = RegExp(r'[^0-9.]');

    return num.tryParse(replaceAll(regex, ''));
  }

  double currencyToNum() {
    return double.parse(replaceAll('B\$ ', '').replaceAll(',', ''));
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

extension NumberFormatExtensionNum on num? {
  String formatWithThousandsSeparator() {
    var milharDotsFormatter = NumberFormat('#,##0.00', 'pt_BR');
    return milharDotsFormatter.format(this);
  }

  String formatWithThousandsSeparatorWithoutComma() {
    var milharDotsFormatter = NumberFormat('#,##0', 'pt_BR');
    return milharDotsFormatter.format(this);
  }
}

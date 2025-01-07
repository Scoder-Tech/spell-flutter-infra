import 'package:intl/intl.dart';

extension DoubleToString on double? {
  String? toStringBRL() {
    if (this == null) return null;

    return toString().replaceAll('.', ',');
  }

  String? toStringCurrencyBRL() {
    if (this == null) return null;


    var dotsFormatter = NumberFormat('#,##0.00', 'pt_BR');
    return dotsFormatter.format(this?.toStringAsFixed(2));
  }
}
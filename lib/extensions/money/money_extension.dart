import 'package:intl/intl.dart';
import 'package:money2/money2.dart';

extension MoneyToString on num {
  String toBRL() {
    var parsedValue = Money.fromNum(this, code: 'BRL').toString();

  String value = parsedValue.substring(2);
  
  List<String> parts = value.split(',');
  
  String integerPart = parts[0];
  String formattedInteger = '';
  for (int i = 0; i < integerPart.length; i++) {
    if ((integerPart.length - i) % 3 == 0 && i != 0) {
      formattedInteger += '.';
    }
    formattedInteger += integerPart[i];
  }

  String formattedValue = 'R\$' + formattedInteger;
  if (parts.length > 1) {
    formattedValue += ',${parts[1]}';
  }


    return formattedValue;
  }

  String toPercentage() {
    return '${(this * 100).toStringAsFixed(2)}%';
  }

  String formatNumberWithMilharDots() {
    var milharDotsFormatter = NumberFormat('#,##0.00', 'pt_BR');
    return milharDotsFormatter.format(this);
  }

   String toAbbreviatedString() {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}mi';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}k';
    } else {
      return '$this';
    }
  }
}

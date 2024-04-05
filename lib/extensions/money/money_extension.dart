import 'package:intl/intl.dart';
import 'package:money2/money2.dart';

extension MoneyToString on num {
  String toBRL() {
    bool isNegative = this < 0;

    var parsedValue = Money.fromNum(this, code: 'BRL').toString();

    String value =
        isNegative ? parsedValue.substring(3) : parsedValue.substring(2);

    List<String> parts = value.split(',');

    String integerPart = parts[0];
    String formattedInteger = '';
    for (int i = 0; i < integerPart.length; i++) {
      if ((integerPart.length - i) % 3 == 0 && i != 0) {
        formattedInteger += '.';
      }
      formattedInteger += integerPart[i];
    }

    String formattedValue =
        isNegative ? 'R\$ -$formattedInteger' : 'R\$$formattedInteger';
    if (parts.length > 1) {
      formattedValue += ',${parts[1]}';
    }

    return formattedValue;
  }

  String toPercentage() {
    return '${(this * 100).toStringAsFixed(2)}%';
  }

  String formatIntWithDots() {
    String value = this.toString();
    if (value.length <= 3) return value;

    String result = '';
    int count = 0;

    for (int i = value.length - 1; i >= 0; i--) {
      result = value[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) {
        result = '.' + result;
      }
    }

    return result;
  }

  String formatNumberWithMilharDots() {
    var milharDotsFormatter = NumberFormat('#,##0.00', 'pt_BR');
    return milharDotsFormatter.format(this);
  }

  String toAbbreviatedString() {
    if (this >= 1000000) {
      return 'R\$ ${(this / 1000000)}mi';
    } else if (this >= 1000) {
      return 'R\$ ${(this / 1000)}k';
    } else {
      return 'R\$ ${this.toStringAsFixed(2).replaceAll('.', ',')}';
    }
  }
}

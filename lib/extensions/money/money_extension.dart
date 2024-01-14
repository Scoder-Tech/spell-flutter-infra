import 'package:intl/intl.dart';
import 'package:money2/money2.dart';

extension MoneyToString on num {
  String toBRL() {
    return Money.fromNum(this, code: 'BRL').toString();
  }

  String formatNumberWithMilharDots() {
    var milharDotsFormatter = NumberFormat('#,##0.00', 'pt_BR');
    return milharDotsFormatter.format(this);
  }
}

import 'package:money2/money2.dart';

extension MoneyToString on num {
  String toBRL() {
    return Money.fromNum(this, code: 'BRL').toString();
  }
}

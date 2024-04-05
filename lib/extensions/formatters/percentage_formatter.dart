import 'package:flutter/services.dart';

class PercentageInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String digitsOnly = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (digitsOnly.length > 4) {
      return oldValue;
    }

    var newText = digitsOnly;

    if (digitsOnly.length > 2) {
      newText = '${newText.substring(0, 2)},${newText.substring(2)}';
    }

    newText = '$newText%';

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length - 1,
      ),
    );
  }
}

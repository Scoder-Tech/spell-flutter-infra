import 'package:flutter/services.dart';

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = '';

    var unformattedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (unformattedText.length > 4) {
      unformattedText = unformattedText.substring(0, 4);
    }

    if (unformattedText.length > 2) {
      var firstHalf = int.parse(unformattedText.substring(0, 2)) > 23
          ? '23'
          : unformattedText.substring(0, 2);
      var secondHalf = int.parse(unformattedText.substring(2)) > 59
          ? '59'
          : unformattedText.substring(2);

      formattedText += firstHalf + ':';
      formattedText += secondHalf;
    } else {
      formattedText = int.parse(unformattedText) > 23 ? '23' : unformattedText;
    }

    final int selectionIndex = formattedText.length;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

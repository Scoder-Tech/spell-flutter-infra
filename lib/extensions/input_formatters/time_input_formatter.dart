import 'package:flutter/services.dart';

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = '';

    var unformattedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (unformattedText.length > 6) {
      unformattedText = unformattedText.substring(0, 6);
    }

    if (unformattedText.length > 4) {
      var firstHalf = int.parse(unformattedText.substring(0, 2)) > 23
          ? '23'
          : unformattedText.substring(0, 2);
      var secondHalf = int.parse(unformattedText.substring(2, 4)) > 59
          ? '59'
          : unformattedText.substring(2, 4);
      var thirdHalf = int.parse(unformattedText.substring(4)) > 59
          ? '59'
          : unformattedText.substring(4);

      formattedText += '$firstHalf:';
      formattedText += '$secondHalf:';
      formattedText += thirdHalf;
    } else if (unformattedText.length > 2) {
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

    int selectionIndex = formattedText.length;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

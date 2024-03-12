import 'package:flutter/services.dart';

class DateTimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    RegExp regex = RegExp(r'\D+');
    var newText = newValue.text.replaceAll(regex, '');

    if (oldValue.text.length > newValue.text.length) {
      return newValue;
    }

    if (newText.length >= 2) {
      var treatedText = newText.substring(0, 2);
      if (int.parse(treatedText) > 31) {
        treatedText = '31';
      }

      newText = treatedText + '/' + newText.substring(2);
    }

    if (newText.length >= 5) {
      var treatedText = newText.substring(3, 5);
      if (int.parse(treatedText) > 12) {
        treatedText = '12';
      }

      newText =
          newText.substring(0, 3) + treatedText + '/' + newText.substring(5);
    }

    if (newText.length >= 10) {
      var treatedText = newText.substring(6, 10);
      var currentYear = DateTime.now().year;

      if (int.parse(treatedText) < currentYear) {
        treatedText = '$currentYear';
      } else if (int.parse(treatedText.substring(0, 2)) > 20) {
        treatedText = '20${treatedText.substring(2)}';
      }

      newText =
          newText.substring(0, 6) + treatedText + ' - ' + newText.substring(10);
    }

    if (newText.length >= 15) {
      var treatedText = newText.substring(13, 15);
      if (int.parse(treatedText) > 23) {
        treatedText = '23';
      }
      newText =
          newText.substring(0, 13) + treatedText + ':' + newText.substring(15);
    }

    if (newText.length >= 18) {
      var treatedText = newText.substring(16, 18);
      if (int.parse(treatedText) > 59) {
        treatedText = '59';
      }
      newText = newText.substring(0, 16) + treatedText;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

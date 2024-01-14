import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var cleanText = newValue.text.replaceAll('.', ''); // Remove existing dots
    var formattedText = _formatThousandDots(cleanText);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: formattedText.length,
      ),
    );
  }

  String _formatThousandDots(String text) {
    if (text.isEmpty) return '';

    var number = int.parse(text);
    var milharDotsFormatter = NumberFormat('#,##0', 'pt_BR');
    var formattedText = milharDotsFormatter.format(number);

    return formattedText;
  }
}

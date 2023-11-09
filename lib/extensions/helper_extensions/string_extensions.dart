import 'dart:ui';

extension StringExtension on String {
  Color? toColor() {
    try {
      String hex = startsWith('#') ? substring(1) : this;

      int intValue = int.parse(hex, radix: 16);

      if (hex.length == 6 || hex.length == 8) {
        return Color(intValue);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

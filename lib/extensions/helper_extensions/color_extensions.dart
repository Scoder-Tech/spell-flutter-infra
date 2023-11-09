import 'dart:ui';

extension ColorExtension on Color {
  // Convert Color to HEX String
  String toHex() {
    return value.toRadixString(16).padLeft(8, '0').toUpperCase();
  }
}

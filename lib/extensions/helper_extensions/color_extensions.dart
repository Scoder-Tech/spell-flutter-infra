import 'dart:ui';

extension ColorExtension on Color {
  String toHex() {
    return value.toRadixString(16).padLeft(8, '0').toUpperCase();
  }
}

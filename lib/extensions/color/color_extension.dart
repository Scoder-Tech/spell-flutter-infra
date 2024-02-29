import 'package:flutter/material.dart';

extension ColorExtension on Color {

  Color getContrastColor() {
    double luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
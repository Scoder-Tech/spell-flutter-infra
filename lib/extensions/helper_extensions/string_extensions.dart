import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:localization/localization.dart';

extension StringExtension on String {
  Color? toColor() {
    var buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  bool toBool() => toLowerCase() == 'true';

  String translate() => i18n();
  String translateFromWeb(BuildContext context) => FlutterI18n.translate(
        context,
        this,
      );

  String removeSymbols() => replaceAll(RegExp(r'[^\s\w]'), '');
}

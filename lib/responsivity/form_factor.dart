import 'package:flutter/material.dart';

class FormFactor {
  static double desktop = 768;
  static double mobile = 600;
  static double handset = 300;
}

ScreenType getFormFactor(BuildContext context) {
  // Use .shortestSide to detect device type regardless of orientation
  double deviceWidth = MediaQuery.of(context).size.width;
  if (deviceWidth > FormFactor.desktop) return ScreenType.desktop;
  if (deviceWidth > FormFactor.mobile) return ScreenType.mobile;
  return ScreenType.handset;
}

enum ScreenType {
  desktop,
  mobile,
  handset,
}

class ViewSizeManager extends StatelessWidget {
  const ViewSizeManager({
    super.key,
    required this.desktop,
    required this.mobile,
  });
  final Widget desktop;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var screenType = getFormFactor(context);
        switch (screenType) {
          case ScreenType.desktop:
            return desktop;
          case ScreenType.mobile:
            return mobile;
          default:
            return mobile;
        }
      },
    );
  }
}

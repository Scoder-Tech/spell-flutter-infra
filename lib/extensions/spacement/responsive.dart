import 'size_config.dart';

extension Responsive on num {
  double get height => SizeConfig.heightMultiplier! * this;

  double get width => SizeConfig.widthMultiplier! * this;

  double get fontSize => SizeConfig.textMultiplier! * this;
}

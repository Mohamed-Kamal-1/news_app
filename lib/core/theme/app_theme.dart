import 'package:flutter/material.dart';

import '../color/app_color.dart';

abstract class AppTheme{


  //light
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    brightness: Brightness.light
  );

  // dark
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,
      brightness: Brightness.dark

  );
}
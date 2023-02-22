

import 'package:artech/core/resources/style/color_manger.dart';
import 'package:flutter/material.dart';

class AppTheme{

  ThemeData lightTheme()=>ThemeData(
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
  );


}
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

mixin AppTheme on ThemeData {
  static ThemeData get light {
    return ThemeData(
      fontFamily: "GESSTwo",
      primaryColor: AppColors.kPrimaryColor,
      splashColor: AppColors.kBorderGreyColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(elevation: 0.0),
      iconTheme: const IconThemeData(color: AppColors.kPrimaryColor),
      inputDecorationTheme: _buildInputDecoration(),
      buttonTheme: const ButtonThemeData(
          buttonColor: Colors.black, splashColor: Colors.grey),
      textTheme: const TextTheme(
          headline6: TextStyle(),
          caption: TextStyle(),
          button: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

InputDecorationTheme _buildInputDecoration() {
  return const InputDecorationTheme(
      alignLabelWithHint: true,
      labelStyle: TextStyle(
          color: AppColors.kLightGreyColor,
          fontWeight: FontWeight.w600,
          fontSize: 20),
      hintStyle: TextStyle(
        color: AppColors.kLightGreyColor,
        fontWeight: FontWeight.w600,
      ),
      // contentPadding: EdgeInsets.all(10),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: AppColors.kPrimaryColor)));
}

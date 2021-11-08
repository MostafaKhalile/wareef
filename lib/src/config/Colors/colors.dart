import 'package:flutter/material.dart';

/// ##################Colors########################
class AppColors {
  static const kPrimaryColor = Color(0xFFC9B71A);
  static const kPrimaryColorLight = Color(0xFFE8D52A);
  static const kPrimaryGradientEnd = Color(0xFFD1A509);
  static const kPrimaryGradientStart = Color(0xFFEFD05E);
  static const kCardColorLight = Color(0xFFC498CB);
  static const kCardColorDark = Color(0xFFA180A7);
  static const kSecondaryColor = Color(0xFF85A380);
  static const kGreenColor = Color(0xFFA1CCA8);
  static const kErrorColor = Color(0xFFDE0606);
  static const kDissmisolor = Color(0xFFFE3F60);
  static const kFavoriteColor = Color(0xFFFF2D55);
  static const kLabelColor = Color(0xFF011B53);
  static const kDarkTextColor = Color(0xFF011B53);
  static const kLightBlueColor = Color(0xFF007AFF);
  static const kLighterBlueColor = Color(0xFF5AC8FA);
  static const kTealColor = Color(0xFF26ECD1);
  static const kYellowColor = Color(0xFFFFCA62);
  static const kDarkYellowColor = Color(0xFFFFCC00);
  static const kDarkGreyColor = Color(0xFF606060);
  static const kLightBlackColor = Color(0xFF101010);
  static const kTextGreyColor = Color(0xFF9E9E9E);
  static const kLightGreyColor = Color(0xFFA8A8A8);
  static const kLighterGreyColor = Color(0xFFF2F2F2);
  static const kShadowGreyColor = Color(0xFFE9E9E9);
}

/// ###################Gradients####################
const kDefaultGradient = LinearGradient(
    colors: [AppColors.kPrimaryColor, AppColors.kPrimaryColorLight],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
const kCardGradient = LinearGradient(
    colors: [AppColors.kCardColorDark, AppColors.kCardColorLight],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight);

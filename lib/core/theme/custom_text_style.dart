import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_pallete.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}

class CustomTextStyles {
  static TextStyle get poppinsBlueGray900 => const TextStyle(
        color: AppPallete.blueGray900,
        fontSize: 70,
        fontWeight: FontWeight.w500,
      ).poppins;

  static TextStyle get bodySmallGray50012 => const TextStyle(
        color: AppPallete.gray500,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ).poppins;
  static TextStyle get bodySmallBlueGray900 => const TextStyle(
        color: AppPallete.blueGray900,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ).poppins;
  static TextStyle get bodySmallGray500 => const TextStyle(
        color: AppPallete.gray500,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ).poppins;
}

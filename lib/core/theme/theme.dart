import 'package:flutter/material.dart';
import 'app_pallete.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.whiteA700,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.whiteA700,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPallete.gray50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(
        color: AppPallete.gray400,
        fontSize: 15,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      suffixIconColor: AppPallete.gray400,
    ),
    textTheme: ThemeData.light()
        .textTheme
        .apply(
          fontFamily: 'Poppins', // Global font family
        )
        .copyWith(
          headlineLarge: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: AppPallete.blueGray900,
          ),
          labelLarge: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppPallete.gray400,
          ),
          titleSmall: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppPallete.gray500,
          ),
          bodySmall: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppPallete.gray400,
          ),
        ),
  );
}

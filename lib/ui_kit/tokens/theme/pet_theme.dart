import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';
import 'package:happy_pet/ui_kit/tokens/typography/pet_typography.dart';

class PetTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    //colorScheme: ColorScheme.fromSeed(seedColor: PetColors.button),
    appBarTheme: AppBarTheme(
      backgroundColor: PetColors.background,
      titleTextStyle: PetTypography.appBarTitle,
    ),
    textTheme: PetTypography.textTheme,
    scaffoldBackgroundColor: PetColors.background,
    buttonTheme: const ButtonThemeData(
      buttonColor: PetColors.button,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: PetTypography.textTheme.labelMedium,
      focusColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(PetColors.button),
        foregroundColor: WidgetStateProperty.all<Color>(PetColors.text),
        textStyle: WidgetStateProperty.all<TextStyle?>(PetTypography.textTheme.titleLarge),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
            )
        ),
        minimumSize: WidgetStateProperty.all<Size?>(Size(double.infinity, 50.h)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: PetColors.button,
      unselectedItemColor: PetColors.text,
    ),
  );
}

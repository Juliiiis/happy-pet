import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class PetTypography{
  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 64.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: PetColors.text,
    ),
    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
        color: PetColors.text,
    ),
    displaySmall: TextStyle(
      fontSize: 32.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.bold,
      color: PetColors.text,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.bold,
        color: PetColors.text,
    ),
    titleLarge: TextStyle(
      fontSize: 15.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
      color: PetColors.text,
    ),
    titleMedium: TextStyle(
      fontSize: 13.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.bold,
      color: PetColors.text,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w100,
        color: PetColors.text,
    ),
    labelSmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w100,
      color: PetColors.button,
    ),
  );

  static TextStyle appBarTitle = TextStyle(
      fontSize: 13.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.bold,
      color: PetColors.text,
    );
}
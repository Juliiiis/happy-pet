import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happy_pet/ui_kit/images/images.dart';

class HappyAppBar  {
  static AppBar happyAppBar = AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        SizedBox(
          height: 39.h,
          width: 39.w,
          child: const Image(image: Images.pawLogo),
        ),
        SizedBox(width: 8.w),
        const Text('Happy Pet'),
      ],
    ),
  );

  static AppBar homeAppBar = AppBar(
    actions: [
      SizedBox(
        height: 30.h,
        width: 30.w,
        child: SvgPicture.asset('assets/icons/notification.svg'),
      ),
      SizedBox(width: 11.w),
      CircleAvatar(radius: 17.5.r),
      SizedBox(width: 39.w),
    ],
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        SizedBox(
          height: 39.h,
          width: 39.w,
          child: const Image(image: Images.pawLogo),
        ),
        SizedBox(width: 8.w),
        const Text('Happy Pet'),
      ],
    ),
  );
}

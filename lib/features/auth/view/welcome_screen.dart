import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/features/auth/widgets/welcome/welcome_button_login.dart';
import 'package:happy_pet/features/auth/widgets/welcome/welcome_button_signup.dart';
import 'package:happy_pet/ui_kit/images/images.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 39.h,
              width: 39.w,
              child: const Image(
                image: Images.pawLogo,
              ),
            ),
            SizedBox(width: 8.w),
            const Text(
              'Happy Pet',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 114.0.r,
              top: 86.r,
            ),
            child: SizedBox(
              width: 368.w,
              height: 438.h,
              child: const Image(image: Images.welcomeDog),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.r),
            child: Column(
              children: [
                Text(
                  'Discover a world of joy and companionship at Happy Pet',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 29.h),
                const WelcomeButtonLogin(),
                SizedBox(height: 29.h),
                const WelcomeButtonSignUp(),
                //SizedBox(height: 72.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

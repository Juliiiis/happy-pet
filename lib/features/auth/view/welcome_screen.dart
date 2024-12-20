import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';
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
      appBar: HappyAppBar.happyAppBar,
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
                NormalButton(title: 'LOGIN', onTap: (){
                  Navigator.of(context).pushNamed('/auth_screen');
                }),
                SizedBox(height: 29.h),
                NormalButton.outlined(title: 'SIGNUP', onTap: (){
                  Navigator.of(context).pushNamed('/sign_up_screen');
                }),
                //SizedBox(height: 72.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/features/auth/widgets/buttons/auth/auth_button_login.dart';
import 'package:happy_pet/features/auth/widgets/buttons/auth/text_button_sign_up.dart';
import 'package:happy_pet/network/auth_user.dart';
import 'package:happy_pet/ui_kit/controls/access_input/input.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/images/images.dart';



class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final AuthUser controller = AuthUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HappyAppBar.happyAppBar,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 850.h,
              width: 430.w,
              child: const Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: Images.girlWithDog,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 60.h,
                  top: 319.h,
                  right: 50.h
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 96.h,
                      width: 177.w,
                      child: Text('Login', style: Theme
                          .of(context)
                          .textTheme
                          .displayLarge)),
                  Text('Please sign in to continue.',
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium),
                  SizedBox(height: 44.h),
                  InputField(
                    controller: controller.nameTextController,
                      hintText: 'EMAIL',
                      prefixIcon: const Icon(Icons.mail_outline)),
                  SizedBox(height: 28.h),
                  InputField(
                    controller: controller.passwordTextController,
                      hintText: 'PASSWORD',
                      prefixIcon: const Icon(Icons.lock_outline)),
                  SizedBox(height: 70.h),
                  const AuthButtonLogin(),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t have an account?', style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium),
                      SizedBox(width: 5.w),
                      const TextButtonSignUp(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

    
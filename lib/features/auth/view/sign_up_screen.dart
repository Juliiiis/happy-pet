import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/features/auth/widgets/buttons/sign_up/back_arrow_buttons.dart';
import 'package:happy_pet/features/auth/widgets/buttons/sign_up/auth_button_sign_up.dart';
import 'package:happy_pet/features/auth/widgets/buttons/sign_up/text_button_login.dart';
import 'package:happy_pet/network/add_user.dart';
import 'package:happy_pet/ui_kit/controls/access_input/input.dart';
import 'package:happy_pet/ui_kit/images/images.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AddUser controller = AddUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 35.r
            ),
          child: Column(
            children: [
              SizedBox(height: 98.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackArrowButtons(),
                  Image(image: Images.signUpDog),
                ],
              ),
              SizedBox(height: 40.h),
              Text('Create Account', style: Theme.of(context).textTheme.displayMedium),
              SizedBox(height: 40.h),
              InputField(
                controller: controller.nameTextController,
                  hintText: 'FULL NAME',
                  prefixIcon: const Icon(Icons.person),
              ),
              SizedBox(height: 35.h),
              InputField(
                controller: controller.emailTextController,
                  hintText: 'EMAIL',
                  prefixIcon: const Icon(Icons.mail_outline)),
              SizedBox(height: 35.h),
              InputField(
                controller: controller.passwordTextController,
                  hintText: 'PASSWORD', prefixIcon: const Icon(Icons.lock_outline)
              ),
              SizedBox(height: 35.h),
              //InputField(controller: controller.passwordTextController,hintText: 'CONFIRM PASSWORD', prefixIcon: const Icon(Icons.lock)),
              SizedBox(height: 70.h),
              const AuthButtonSignUp(),
              SizedBox(height: 70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have a account?', style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(width: 5.w),
                  const TextButtonLogin(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

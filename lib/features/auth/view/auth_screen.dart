import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_pet/features/auth/widgets/auth/auth_button_login.dart';
import 'package:happy_pet/ui_kit/images/images.dart';



class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_outlined),//const Image(image: PetIcons.backArrow),
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
      ),
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
                  child: Text('Login', style: Theme.of(context).textTheme.displayLarge)),
                Text('Please sign in to continue.',
                  style: Theme.of(context).textTheme.labelMedium),
                SizedBox(height: 44.h),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    prefixIcon: SvgPicture.asset('assets/icons/mail.svg'), //const Icon(Icons.mail_outline),
                  ),
                ),
                SizedBox(height: 28.h),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    prefixIcon: const Icon(Icons.lock_outline)
                    //Image(image: PetIcons.password),
                  ),
                ),
                SizedBox(height: 70.h),
                const AuthButtonLogin(),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don`t have an account?',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      style: Theme.of(context).textTheme.labelSmall,
                        'Sign up',
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/features/auth/widgets/auth/auth_button_login.dart';
import 'package:happy_pet/ui_kit/images/images.dart';
import 'package:happy_pet/ui_kit/tokens/icons/pet_icons.dart';

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
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Image(
              image: Images.girlWithDog,
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
                SizedBox(height: 42.h),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    prefixIcon: Image(
                      height: 25.h,
                        width: 25.w,
                        image: PetIcons.email
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    prefixIcon: Image(
                      height: 25.h,
                        width: 25.w,
                        image: PetIcons.password
                    ),
                  ),
                ),
                SizedBox(height: 72.h),
                const AuthButtonLogin(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

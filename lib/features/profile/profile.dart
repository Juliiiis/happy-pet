import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                  height: 268.h,
                  width: 372.w,
                  decoration: BoxDecoration(
                    color: PetColors.button,
                    borderRadius: BorderRadius.circular(20),
                  )),
              SizedBox(height: 35.h),
              NormalButton.outlined(
                  title: 'Edit a profile',
                  onTap: (){
                    Navigator.of(context).pushNamed('/profile_info');
                  }),
              SizedBox(height: 35.h),
              NormalButton.outlined(title: 'My ads', onTap: () {
                Navigator.of(context).pushNamed('/my_ads');
              }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:happy_pet/data/network/user_api.dart';
import 'package:happy_pet/data/storage/user/user_storage.dart';
import 'package:happy_pet/ui_kit/controls/access_input/input.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final TextEditingController _userName;
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final UserDTO _user;
  final _userApi = UserApi();

  @override
  void initState() {
    _userName = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _user = UserStorage().user;
    if (_user.username != null && (_user.username ?? '').isNotEmpty) {
      _userName.text = _user.username!;
    }


    super.initState();
  }

  @override
  void dispose() {
    _userName.clear();
    _firstName.clear();
    _lastName.clear();
    _email.clear();
    _phone.clear();
    super.dispose();
  }



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
                )
              ),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'USERNAME',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _userName),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'FIRST NAME',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _firstName),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'LAST NAME',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _lastName),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'EMAIL',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _email),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'PHONE',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _phone),
              SizedBox(height: 35.h),
              NormalButton(
                title: 'UPDATE',
                onTap: () {
                  final updatedUser = _user.copyWith(username: _userName.text);
                  _userApi.updateUser(user: updatedUser);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:happy_pet/data/repository/user_repository.dart';
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
  UserDTO get _user => UserStorage().user;
  final _userRepo = UserRepository();

  @override
  void initState() {
    _userName = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();

    if (_user.username != null && (_user.username ?? '').isNotEmpty) {
      _userName.text = _user.username!;
    }
    if (_user.firstName != null && (_user.firstName ?? '').isNotEmpty) {
      _firstName.text = _user.firstName!;
    }
    if (_user.lastName != null && (_user.lastName ?? '').isNotEmpty) {
      _lastName.text = _user.lastName!;
    }
    if (_user.email != null && (_user.email ?? '').isNotEmpty) {
      _email.text = _user.email!;
    }
    if (_user.phone != null && (_user.phone ?? '').isNotEmpty) {
      _phone.text = _user.phone!;
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

  Future<void> _onUpdate() async {
    final updatedUser = _user.copyWith(
        username: _userName.text,
        firstName: _firstName.text,
        lastName: _lastName.text,
        email: _email.text,
        phone: _phone.text);

    if (updatedUser.username == null &&
        updatedUser.firstName == null &&
        updatedUser.lastName == null &&
        updatedUser.email == null &&
        updatedUser.phone == null) return;

    await _userRepo.updateUser(updaterUser: updatedUser);
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
                  )),
              SizedBox(height: 35.h),
              InputField(hintText: 'USERNAME', prefixIcon: const Icon(Icons.pets), controller: _userName),
              SizedBox(height: 35.h),
              InputField(hintText: 'FIRST NAME', prefixIcon: const Icon(Icons.pets), controller: _firstName),
              SizedBox(height: 35.h),
              InputField(hintText: 'LAST NAME', prefixIcon: const Icon(Icons.pets), controller: _lastName),
              SizedBox(height: 35.h),
              InputField(hintText: 'EMAIL', prefixIcon: const Icon(Icons.pets), controller: _email),
              SizedBox(height: 35.h),
              InputField(hintText: 'PHONE', prefixIcon: const Icon(Icons.pets), controller: _phone),
              SizedBox(height: 35.h),
              NormalButton(
                title: 'UPDATE',
                onTap: _onUpdate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/user/user.dart';
import 'package:happy_pet/data/repository/user_repository.dart';
import 'package:happy_pet/features/auth/widgets/buttons/sign_up/back_arrow_buttons.dart';
import 'package:happy_pet/features/auth/widgets/buttons/sign_up/text_button_login.dart';
import 'package:happy_pet/ui_kit/controls/access_input/input.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';
import 'package:happy_pet/ui_kit/images/images.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _nameTextController;
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _confirmPasswordController;

  final UserRepository _userRepo = UserRepository();

  @override
  void initState() {
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.clear();
    _emailTextController.clear();
    _passwordTextController.clear();
    _confirmPasswordController.clear();
    super.dispose();
  }

  Future<bool> _createUser() async {
    final name = _nameTextController.text;
    final email = _emailTextController.text;
    final password = _passwordTextController.text;
    final confirmPassword = _confirmPasswordController.text;
    final isFilled = name.isNotEmpty && password.isNotEmpty && email.isNotEmpty;
    final isIdentical = password == confirmPassword;

    if (!isFilled && !isIdentical) return false;

    final createResult = await _userRepo.createUser(
        user: UserDTO(
      username: name,
      password: password,
      email: email,
    ));
    return createResult;
  }

  _onSignUP(BuildContext context) async {
    final isCreated = await _createUser();
    if (!context.mounted) return;
    if (!isCreated) {
      const snackBar = SnackBar(
        content: Text('Печаль с регистрацией'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    Navigator.of(context).pushNamed('/main_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.r),
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
                controller: _nameTextController,
                hintText: 'FULL NAME',
                prefixIcon: const Icon(Icons.person),
              ),
              SizedBox(height: 35.h),
              InputField(
                  controller: _emailTextController, hintText: 'EMAIL', prefixIcon: const Icon(Icons.mail_outline)),
              SizedBox(height: 35.h),
              InputField(
                  controller: _passwordTextController,
                  hintText: 'PASSWORD',
                  prefixIcon: const Icon(Icons.lock_outline)),
              SizedBox(height: 35.h),
              InputField(
                  controller: _confirmPasswordController,
                  hintText: 'CONFIRM PASSWORD',
                  prefixIcon: const Icon(Icons.lock)),
              SizedBox(height: 70.h),
              NormalButton(
                title: 'SIGNUP',
                onTap: () => _onSignUP(context),
              ),
              SizedBox(height: 70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have a account?',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
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

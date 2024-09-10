import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/repository/user_repository.dart';
import 'package:happy_pet/features/auth/widgets/buttons/auth/text_button_sign_up.dart';
import 'package:happy_pet/ui_kit/controls/access_input/input.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';
import 'package:happy_pet/ui_kit/images/images.dart';



class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController _nameTextController;
  late final TextEditingController _passwordTextController;

  final UserRepository _userRepo = UserRepository();

  @override
  void initState() {
    _nameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.clear();
    _passwordTextController.clear();
    super.dispose();
  }

  Future<bool> _login() async {
    final result = await _userRepo.login(
      username: _nameTextController.text,
      password: _passwordTextController.text,
    );
    if (result) {
      await _userRepo.getUserByName(username: _nameTextController.text);
      return true;
    }
    return false;
  }

  _onAuth(BuildContext context) async {
    final isAuth = await _login();
    if (!isAuth) return;
    if (!context.mounted) return;
    Navigator.of(context).pushNamed('/main_screen');
  }

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
                      controller: _nameTextController,
                      hintText: 'NAME',
                      prefixIcon: const Icon(Icons.person)),
                  SizedBox(height: 28.h),
                  InputField(
                      controller: _passwordTextController,
                      hintText: 'PASSWORD',
                      prefixIcon: const Icon(Icons.lock_outline)),
                  SizedBox(height: 70.h),
                  NormalButton(
                      title: 'LOGIN',
                      onTap: () => _onAuth(context)),
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

/*class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({super.key});

  final errorMessage = 'Неверный логин или пароль, проверьте правильность введенных данных';

  @override
  Widget build(BuildContext context) {
    return  Text(
      errorMessage,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
*/

    
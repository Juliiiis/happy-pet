import 'package:flutter/material.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';

class AuthButtonSignUp extends StatefulWidget {
  const AuthButtonSignUp({super.key});

  @override
  State<AuthButtonSignUp> createState() => _AuthButtonSignUpState();
}

class _AuthButtonSignUpState extends State<AuthButtonSignUp> {

  void _goHome(){
    Navigator.of(context).pushNamed('/main_screen');
  }

  @override
  Widget build(BuildContext context) {
    return NormalButton(title: 'SIGNUP', onTap: _goHome);
  }
}
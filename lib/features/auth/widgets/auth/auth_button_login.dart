import 'package:flutter/material.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';


class AuthButtonLogin extends StatefulWidget {
  const AuthButtonLogin({super.key});

  @override
  State<AuthButtonLogin> createState() => _AuthButtonLoginState();
}

class _AuthButtonLoginState extends State<AuthButtonLogin> {

  void _login(){
    Navigator.of(context).pushNamed('/main_screen');
  }

  @override
  Widget build(BuildContext context) {
    return NormalButton(title: 'LOGIN', onTap: _login);
  }
}
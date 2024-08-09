import 'package:flutter/material.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';


class WelcomeButtonLogin extends StatefulWidget {
  const WelcomeButtonLogin({super.key});

  @override
  State<WelcomeButtonLogin> createState() => _WelcomeButtonLoginState();
}

class _WelcomeButtonLoginState extends State<WelcomeButtonLogin> {

  void _login(){
    Navigator.of(context).pushNamed('/auth_screen');
  }

  @override
  Widget build(BuildContext context) {
    return NormalButton(title: 'LOGIN', onTap: _login);
  }
}

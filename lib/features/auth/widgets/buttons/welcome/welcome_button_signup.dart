import 'package:flutter/material.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';


class WelcomeButtonSignUp extends StatefulWidget {
  const WelcomeButtonSignUp({super.key});

  @override
  State<WelcomeButtonSignUp> createState() => _WelcomeButtonSignUpState();
}

class _WelcomeButtonSignUpState extends State<WelcomeButtonSignUp> {

  void _signUp(){
    Navigator.of(context).pushNamed('/sign_up_screen');
  }

  @override
  Widget build(BuildContext context) {
    return NormalButton.outlined(title: 'SIGNUP', onTap: _signUp);
  }
}

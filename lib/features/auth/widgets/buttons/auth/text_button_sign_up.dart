import 'package:flutter/material.dart';

class TextButtonSignUp extends StatefulWidget {
  const TextButtonSignUp({super.key});

  @override
  State<TextButtonSignUp> createState() => _TextButtonSignUpState();
}

class _TextButtonSignUpState extends State<TextButtonSignUp> {

  void _signUp(){
    Navigator.of(context).pushNamed('/sign_up_screen');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _signUp,
      child: Text(
          style: Theme.of(context).textTheme.labelSmall, 'Sign up'
      ),
    );
  }
}

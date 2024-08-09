import 'package:flutter/material.dart';

class TextButtonLogin extends StatefulWidget {
  const TextButtonLogin({super.key});

  @override
  State<TextButtonLogin> createState() => _TextButtonLoginState();
}

class _TextButtonLoginState extends State<TextButtonLogin> {

  void _login(){
    Navigator.of(context).pushNamed('/auth_screen');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _login,
      child: Text(
          style: Theme.of(context).textTheme.labelSmall, 'Login'
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;

  const InputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        focusedBorder: InputBorder.none
      ),
    );
  }
}

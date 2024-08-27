import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;
  final TextEditingController controller ;

  const InputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    required this.controller,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        focusedBorder: InputBorder.none
      ),
    );
  }
}

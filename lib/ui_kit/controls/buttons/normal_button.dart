import 'package:flutter/material.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    required this.title,
    required this.onTap,
    this.isOutlined = false,
    super.key,
  });

  factory NormalButton.outlined({
    required String title,
    required Function() onTap,
  }) {
    return NormalButton(
      title: title,
      onTap: onTap,
      isOutlined: true,
    );
  }

  final String title;
  final Function() onTap;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: isOutlined
          ? ElevatedButton.styleFrom(
              backgroundColor: PetColors.background,
              side: const BorderSide(
                color: PetColors.button,
                width: 2,
              ),
            )
          : ElevatedButton.styleFrom(
        elevation: 10.0,
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}

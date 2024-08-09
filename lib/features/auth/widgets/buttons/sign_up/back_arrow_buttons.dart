import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BackArrowButtons extends StatefulWidget {
  const BackArrowButtons({super.key});

  @override
  State<BackArrowButtons> createState() => _BackArrowButtonsState();
}

class _BackArrowButtonsState extends State<BackArrowButtons> {

  void _goBack(){
    Navigator.of(context).pushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goBack,
      child: SizedBox(
          height: 50.h,
          width: 50.w,
          child: SvgPicture.asset('assets/icons/back_arrow.svg'),
      ),
    );
  }
}

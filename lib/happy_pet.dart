import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/core/router/routes.dart';
import 'package:happy_pet/ui_kit/tokens/theme/pet_theme.dart';

class HappyPet extends StatelessWidget {
  const HappyPet({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430,941),
        builder: (_, child){
          return MaterialApp(
            title: 'Happy Pet',
            theme: PetTheme.theme,
            routes: routes,
          );
        }
    );
  }
}
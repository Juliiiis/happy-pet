import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/images/images.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HappyAppBar.homeAppBar,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: 32.h
            ),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 268.h,
                width: 372.w,
                child: const Image(image: Images.component1),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 29.r),
            sliver: SliverGrid(delegate: SliverChildBuilderDelegate(
                (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 111.h,
                      width: 109.w,
                      decoration: const BoxDecoration(
                          color: PetColors.button,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  );
                },
              childCount: 12,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: PetColors.button,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}

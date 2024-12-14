import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/category/category.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/repository/pet_repository.dart';
import 'package:happy_pet/ui_kit/controls/access_input/input.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class PetForm extends StatelessWidget {
   PetForm({super.key});

   final StreamController<String> _nameStreamController = StreamController<String>();

   final StreamController<String> _ageStreamController = StreamController<String>();

   final StreamController<String> _categoryStreamController = StreamController<String>();

   final _nameTextController = TextEditingController();
   final _ageTextController = TextEditingController();
   final _categoryTextController = TextEditingController();

   final PetRepository _petRepo = PetRepository();

  Future<void> _createPet(String name, String age, String category) async{
    final isFiled = name.isNotEmpty && age.isNotEmpty && category.isNotEmpty;
    if(!isFiled) return;

    await _petRepo.createPet(
      pet: PetDTO(category: CategoryDTO(0, category), name: name, age: age),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HappyAppBar.happyAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.r),
          child: Column(
            children: [
              Text('Fill in the information about the pet',
              style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 35.h),
              Container(
                  height: 268.h,
                  width: 372.w,
                  decoration: BoxDecoration(
                    color: PetColors.button,
                    borderRadius: BorderRadius.circular(20),
                  ),
                child: Icon(
                  Icons.photo_camera,
                  size: 50.0.h,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'NAME',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _nameTextController
                  ..addListener(() {
                    _nameStreamController.add(_nameTextController.text);
                  })
              ),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'AGE',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _ageTextController
                      ..addListener((){
                        _ageStreamController.add(_ageTextController.text);
                  }),
              ),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'CATEGORY',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _categoryTextController
                  ..addListener((){
                    _categoryStreamController.add(_categoryTextController.text);
                  })),
              SizedBox(height: 35.h),
              NormalButton(title: 'Put ad', onTap: () async{
                final name = await _nameStreamController.stream.first;
                final age = await _ageStreamController.stream.first;
                final category = await _categoryStreamController.stream.first;

                await _createPet(name, age, category);
              }
        ),
            ],
          ),
        ),
      ),
    );
  }
}

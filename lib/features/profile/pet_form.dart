import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/category/category.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/repository/pet_repository.dart';
import 'package:happy_pet/ui_kit/controls/access_input/input.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/controls/buttons/normal_button.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  late final TextEditingController _nameTextController;
  late final TextEditingController _ageTextController;
  late final TextEditingController _categoryTextController;
  
  final PetRepository _petRepo = PetRepository();

  @override
  void initState() {
    _nameTextController = TextEditingController();
    _ageTextController = TextEditingController();
    _categoryTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.clear();
    _ageTextController.clear();
    _categoryTextController.clear();
    super.dispose();
  }

  Future<void> _createPet() async{
    final petName = _nameTextController.text;
    final petAge = _ageTextController.text;
    final petCategory = _categoryTextController.text;
    final isFiled = petName.isNotEmpty && petAge.isNotEmpty && petCategory.isNotEmpty;
    if(!isFiled) return;

    await _petRepo.createPet(
      pet: PetDTO(category: CategoryDTO(0, petCategory), name: petName, age: petAge),
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
              ),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'AGE',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _ageTextController
              ),
              SizedBox(height: 35.h),
              InputField(
                  hintText: 'CATEGORY',
                  prefixIcon: const Icon(Icons.pets),
                  controller: _categoryTextController),
              SizedBox(height: 35.h),
              NormalButton(title: 'Put ad', onTap: _createPet),
            ],
          ),
        ),
      ),
    );
  }
}

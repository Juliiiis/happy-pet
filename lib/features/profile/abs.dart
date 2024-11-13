import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/storage/pet/pet_storage.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  State<MyAds> createState() => _MyAdsState();
}
class _MyAdsState extends State<MyAds> {

  List<PetDTO> pets = [];

  Future<void> _getAllPets() async {
    List<PetDTO> allPets = await PetStorage().getAllPets();
    setState(() {
      pets = allPets;
    });
  }

  @override
  void initState() {
    _getAllPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HappyAppBar.happyAppBar,
      body: CustomScrollView(
        slivers: [
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: pets.length,
                  (BuildContext context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: MyPetCard(petDTO: pets[index]),
                  );
                  }
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: PetColors.text,
        backgroundColor: PetColors.button,
        onPressed: (){
          Navigator.of(context).pushNamed('/pet_form');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyPetCard extends StatelessWidget {
  const MyPetCard({required this.petDTO, super.key});

  final PetDTO petDTO;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Container(
              width: 200.w,
              height: 160.h,
              color: Colors.grey,
            ),
          ),
          Padding(padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(petDTO.name ?? ' ', overflow: TextOverflow.ellipsis, maxLines: 1,),
                SizedBox(height: 10.h),
                Text('${petDTO.id}', overflow: TextOverflow.ellipsis, maxLines: 1,),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


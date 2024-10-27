import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({required this.pets,super.key});

  final List<PetDTO> pets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6
            ),
            delegate: SliverChildBuilderDelegate(
                childCount: pets.length,
                    (BuildContext context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PetCard(petDTO: pets[index]),
              );
            }),
          )
        ],
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  const PetCard({required this.petDTO, super.key});

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

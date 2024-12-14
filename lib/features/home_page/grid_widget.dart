import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/ui_kit/images/images.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({required this.pets,super.key});

  final List<PetDTO> pets;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
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
                childCount: widget.pets.length,
                    (BuildContext context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PetCard(petDTO: widget.pets[index], imageUrl: '',),
              );
            }),
          )
        ],
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  const PetCard({required this.petDTO, super.key, required this.imageUrl});

  final String imageUrl;
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
            child: SizedBox(
              width: 100.w,
              height: 150.h,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return const Opacity(opacity: 0.3,
                  child: Image(image: Images.paw));
              }
              ),
            ),
          ),
          //Image.network(petDTO.photoUrls?.first ?? ''),
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

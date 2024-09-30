import 'package:flutter/material.dart';
import 'package:happy_pet/ui_kit/tokens/colors/pet_colors.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

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
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, index){
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: PetColors.button,
                      ),
                      height: 50,
                      width: 50,
                    ),
                  );
                },
                childCount: 60
            ),
          ),
        ],
      ),
    );
  }
}
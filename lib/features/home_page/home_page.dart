import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_pet/data/dto/pet/pet.dart';
import 'package:happy_pet/data/repository/pet_repository.dart';
import 'package:happy_pet/features/home_page/grid_widget.dart';
import 'package:happy_pet/ui_kit/controls/app_bar/happy_app_bar.dart';
import 'package:happy_pet/ui_kit/images/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<AssetImage> imageList = [
  Images.component1,
  Images.component1,
  Images.component1
];

late List<Widget> _pages;

int _activePage = 0;

final PageController _pageController = PageController(initialPage: 0);

Timer? _timer;

class _HomePageState extends State<HomePage> {

  final PetRepository _petRepository = PetRepository();

  List<PetDTO> available = [];
  List<PetDTO> pending = [];
  List<PetDTO> sold = [];

  void startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 3), (timer){
      if(_pageController.page == imageList.length - 1){
        _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut
        );
      }else{
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }
  
  @override
  void initState() {
    super.initState();
    _pages = List.generate(imageList.length, (index) => const Image(image: Images.component1),
    );
    startTimer();
    _findByStatus().then((_){
      setState(() {});
    });

  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  Future<void> _findByStatus() async {
    available =  await _petRepository.findByStatus(statuses: ['available']);
    pending =  await _petRepository.findByStatus(statuses: ['pending']);
    sold =  await _petRepository.findByStatus(statuses: ['sold']);
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: HappyAppBar.homeAppBar,
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding:  EdgeInsets.only(bottom: 10.h, top: 10.h),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 268.h,
                  width: 327.w,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imageList.length,
                      onPageChanged: (value) {
                      setState(() {
                        _activePage = value;
                      });
                      },
                      itemBuilder: (context, index) {
                      return _pages[index];
                      }
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn
                          );
                        },
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: _activePage == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 29.r, right: 29.r, bottom: 20.h),
              sliver: const SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                title: TabBar(tabs: [
                  Tab(text: 'Available',),
                  Tab(text: 'Pending'),
                  Tab(text: 'Sold'),
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 29.r),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    children: [
                      GridWidget(pets: available),
                      GridWidget(pets: pending),
                      GridWidget(pets: sold),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




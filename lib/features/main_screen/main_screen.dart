import 'package:flutter/material.dart';
import 'package:happy_pet/features/cart/cart.dart';
import 'package:happy_pet/features/home_page/home_page.dart';
import 'package:happy_pet/features/profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void onItemTab(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomePage(),
    const MyCart(),
    const Profile(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),//Image(image: PetIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),//Image(image: PetIcons.shoppingCart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),//Image(image: PetIcons.person),
            label: '',
          ),
        ],
        onTap: onItemTab,
      ),
    );
  }
}
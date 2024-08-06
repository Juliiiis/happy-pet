import 'package:happy_pet/features/auth/view/welcome_screen.dart';
import 'package:happy_pet/features/auth/view/auth_screen.dart';
import 'package:happy_pet/features/main_screen/main_screen.dart';


final routes = {
  '/' : (context) => const WelcomeScreen(),
  '/auth_screen' : (context) => const AuthScreen(),
  '/main_screen' : (context) => const MainScreen(),
  //'/profile' : (context) => const ProfileScreen(),
//  'photo_grid_screen' : (context) => const PhotoGridScreen(),
};
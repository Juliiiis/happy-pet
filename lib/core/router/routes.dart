import 'package:happy_pet/features/auth/view/sign_up_screen.dart';
import 'package:happy_pet/features/auth/view/welcome_screen.dart';
import 'package:happy_pet/features/auth/view/auth_screen.dart';
import 'package:happy_pet/features/main_screen/main_screen.dart';
import 'package:happy_pet/features/profile/abs.dart';
import 'package:happy_pet/features/profile/pet_form.dart';
import 'package:happy_pet/features/profile/profile_info.dart';


final routes = {
  '/' : (context) => const WelcomeScreen(),
  '/auth_screen' : (context) => const AuthScreen(),
  '/main_screen' : (context) => const MainScreen(),
  '/sign_up_screen' : (context) => const SignUpScreen(),
  '/profile_info' : (context) => const ProfileInfo(),
  '/my_ads' : (context) => const MyAds(),
  '/pet_form' : (context) => const PetForm(),
};
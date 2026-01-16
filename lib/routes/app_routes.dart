import 'package:get/get.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding1/screen/onboading1_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding2/screen/onboarding_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding3/screen/onboarding_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding4/screen/onboarding4_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding5/screen/onboarding5_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding6/screen/onboarding6_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding7/screen/onboarding7_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding8/screen/onboarding8_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding9/screen/onboarding9_screen.dart';
import 'package:imvelranvet/feature/welcome_boarding/screen/user_boarding_screen.dart';

class AppRoutes {
  static String welcomeScreen = "/welcome";
  static String onboarding1 = "/onboarding1";
  static String onboarding2 = "/onboarding2";
  static String onboarding3 = "/onboarding3";
  static String onboarding4 = "/onboarding4";
  static String onboarding5 = "/onboarding5";
  static String onboarding6 = "/onboarding6";
  static String onboarding7 = "/onboarding7";
  static String onboarding8 = "/onboarding8";
  static String onboarding9 = "/onboarding9";

  static List<GetPage> routes = [
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: onboarding1, page: () => ThemeCompanionScreen()),
    GetPage(name: onboarding2, page: () => OnboardingScreen2()),
    GetPage(name: onboarding3, page: () => OnboardingScreen3()),
    GetPage(name: onboarding4, page: () => OnboardingScreen4()),
    GetPage(name: onboarding5, page: () => OnboardingScreen5()),
    GetPage(name: onboarding6, page: () => OnboardingScreen6()),
    GetPage(name: onboarding7, page: () => OnboardingScreen7()),
    GetPage(name: onboarding8, page: () => OnboardingScreen8()),
    GetPage(name: onboarding9, page: () => OnboardingScreen9())
  ];
}

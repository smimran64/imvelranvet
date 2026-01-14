import 'package:get/get.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding1/screen/onboading1_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding2/screen/onboarding_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding3/screen/onboarding_screen.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding4/screen/onboarding4_screen.dart';
import 'package:imvelranvet/feature/welcome_boarding/screen/user_boarding_screen.dart';

class AppRoutes {
  static String welcomeScreen = "/welcome";
  static String onboarding1 = "/onboarding1";
  static String onboarding2 = "/onboarding2";
  static String onboarding3 = "/onboarding3";
  static String onboarding4 = "/onboarding4";

  static List<GetPage> routes = [
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: onboarding1, page: () => ThemeCompanionScreen()),
    GetPage(name: onboarding2, page: () => OnboardingScreen2()),
    GetPage(name: onboarding3, page: () => OnboardingScreen3()),
    GetPage(name: onboarding4, page: () => OnboardingScreen4()),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController4 extends GetxController {
  final currentStep = 4.obs;
  final totalSteps = 9.obs;
  final xpPoints = 10.obs;

  final selectedGender = RxnInt();

  final List<String> genders = ['Male', 'Female'];

  void selectGender(int index) {
    selectedGender.value = index;
  }

  double get progressValue => currentStep.value / totalSteps.value;

  void onBackPressed() {
    Get.back();
  }

  void onContinue() {
    if (selectedGender.value == null) {
      Get.snackbar(
        'Required',
        'Please select your gender',
        backgroundColor: Colors.orange.withOpacity(0.7),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Navigate to next screen
    Get.snackbar(
      'Success',
      'Gender selected! +${xpPoints.value} XP',
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

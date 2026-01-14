import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/utils/constand/icon_path.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';

class ThemeCompanionController extends GetxController {
  // Selected companion index
  final selectedIndex = Rxn<int>();

  // Current step and total steps
  final currentStep = 1.obs;
  final totalSteps = 9.obs;

  // XP points
  final xpPoints = 10.obs;

  // Progress calculation
  double get progressValue => currentStep.value / totalSteps.value;

  // Companion data
  final companions = <CompanionModel>[
    CompanionModel(
      id: 0,
      name: 'Ser Kael Thornwatch',
      title: 'The Unknown',
      theme: 'Active Theme & Companion',
      unlockXp: null,
      imagePath: ImagesPath.serkael,
      bgImage: ImageIcons.pyrIcon, // 👈
      isActive: true,
      bgGradient: const LinearGradient(
        begin: .topLeft,
        end: .bottomRight,
        colors: [
          Color(0xFF310101),
          Color(0xFF550606),
          Color(0xFF550606),
          Color(0xFF310101),
          Color(0xFF550606),
          Color(0xFF310101),
        ],
      ),
    ),
    CompanionModel(
      id: 1,
      name: 'Riven Ashcroft',
      title: 'High Lord of the Fall',
      theme: '',
      unlockXp: 250,
      imagePath: ImagesPath.riven,
      bgImage: ImageIcons.rivIcon, // 👈
      isActive: false,
      bgGradient: const LinearGradient(
        colors: [Color(0xFF1B0033), Color(0xFF35065E), Color(0xFF1B0033)],
      ),
    ),
    CompanionModel(
      id: 2,
      name: 'Pyraxis',
      title: 'The Emberhound',
      theme: '',
      unlockXp: 250,
      imagePath: ImagesPath.pyrax,
      bgImage: ImageIcons.serIcon, // 👈
      isActive: false,
      bgGradient: const LinearGradient(
        colors: [Color(0xFF0F0E11), Color(0xFF201C23), Color(0xFF0F0E11)],
      ),
    ),
    CompanionModel(
      id: 3,
      name: 'Bram Ironledger',
      title: 'Keeper of the Codex',
      theme: '',
      unlockXp: 250,
      imagePath: ImagesPath.bram,
      bgImage: ImageIcons.bramIcon, // 👈
      isActive: false,
      bgGradient: const LinearGradient(
        colors: [Color(0xFF111C18), Color(0xFF1E332C), Color(0xFF111C18)],
      ),
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    // Set first companion as selected by default
    selectedIndex.value = 0;
  }

  // Select a companion
  void selectCompanion(int index) {
    if (isCompanionUnlocked(index)) {
      selectedIndex.value = index;
    } else {
      Get.snackbar(
        'Locked',
        'This companion requires ${companions[index].unlockXp} XP to unlock',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  // Check if companion is unlocked
  bool isCompanionUnlocked(int index) {
    final companion = companions[index];
    if (companion.unlockXp == null) return true;
    return companion.isActive || xpPoints.value >= companion.unlockXp!;
  }

  // Continue button action
  void onContinue() {
    if (selectedIndex.value != null) {
      final selected = companions[selectedIndex.value!];

      Get.snackbar(
        'Companion Selected',
        'You have chosen ${selected.name}!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.7),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // Navigate to next screen
      // Get.toNamed('/next-screen');
    } else {
      Get.snackbar(
        'No Selection',
        'Please select a companion first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  // Unlock companion with XP
  void unlockCompanion(int index) {
    final companion = companions[index];
    if (companion.unlockXp != null && xpPoints.value >= companion.unlockXp!) {
      xpPoints.value -= companion.unlockXp!;
      companion.isActive = true;
      companions.refresh();

      Get.snackbar(
        'Unlocked!',
        '${companion.name} is now unlocked',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.7),
        colorText: Colors.white,
      );

      // Auto select after unlock
      selectCompanion(index);
    } else {
      Get.snackbar(
        'Insufficient XP',
        'You need ${companion.unlockXp} XP to unlock this companion',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  // Go back
  void onBackPressed() {
    Get.back();
  }
}

// Companion Model
class CompanionModel {
  final int id;
  final String name;
  final String title;
  final String theme;
  final int? unlockXp;
  final String imagePath;
  final String bgImage;
  bool isActive;
  final LinearGradient bgGradient;

  CompanionModel({
    required this.id,
    required this.name,
    required this.title,
    required this.theme,
    this.unlockXp,
    required this.imagePath,
    required this.bgImage,
    required this.isActive,
    required this.bgGradient,
  });
}

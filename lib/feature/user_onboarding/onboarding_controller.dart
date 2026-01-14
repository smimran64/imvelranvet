import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // Current step tracking
  final currentStep = 1.obs;
  final totalSteps = 9;

  // XP tracking
  final currentXP = 0.obs;

  // Screen 1: Theme Companion Selection
  final selectedCompanion = Rx<String?>(null);

  // Screen 2-9: আপনার requirements অনুযায়ী add করব
  final selectedItems = <String>[].obs;

  // Progress calculation
  double get progress => currentStep.value / totalSteps;
  String get progressText => '${currentStep.value}/$totalSteps';

  // Navigation methods
  void nextStep() {
    if (currentStep.value < totalSteps) {
      addXP(10); // প্রতিটা step complete এ 10 XP
      currentStep.value++;

      // Navigate to next screen based on step
      _navigateToStep(currentStep.value);
    } else {
      completeOnboarding();
    }
  }

  void previousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
      Get.back();
    }
  }

  void skipToStep(int step) {
    if (step > 0 && step <= totalSteps) {
      currentStep.value = step;
      _navigateToStep(step);
    }
  }

  // Private navigation helper
  void _navigateToStep(int step) {
    switch (step) {
      case 1:
        // Already on screen 1
        break;
      case 2:
        // Get.to(() => const OnboardingScreen2());
        break;
      case 3:
        // Get.to(() => const OnboardingScreen3());
        break;
      // আরো screens পরে add করব
      default:
        break;
    }
  }

  // Screen 1: Companion selection methods
  void selectCompanion(String companionId) {
    selectedCompanion.value = companionId;
  }

  bool isCompanionSelected(String companionId) {
    return selectedCompanion.value == companionId;
  }

  // General selection methods (for other screens)
  void toggleItemSelection(String itemId) {
    if (selectedItems.contains(itemId)) {
      selectedItems.remove(itemId);
    } else {
      selectedItems.add(itemId);
    }
  }

  bool isItemSelected(String itemId) {
    return selectedItems.contains(itemId);
  }

  void clearSelections() {
    selectedItems.clear();
  }

  // XP methods
  void addXP(int xp) {
    currentXP.value += xp;
  }

  // Validation - প্রতিটা screen এর জন্য আলাদা validation
  bool canContinue() {
    switch (currentStep.value) {
      case 1:
        return selectedCompanion.value != null;
      case 2:
        return selectedItems.isNotEmpty;
      // আরো cases পরে add করব
      default:
        return true;
    }
  }

  // Complete onboarding
  void completeOnboarding() {
    // Save data to local storage
    // Navigate to home
    Get.offAllNamed('/home');
  }

  // Reset controller
  void resetOnboarding() {
    currentStep.value = 1;
    currentXP.value = 0;
    selectedCompanion.value = null;
    selectedItems.clear();
  }

  @override
  void onInit() {
    super.onInit();
    currentStep.value = 1;
    currentXP.value = 0;
  }

  @override
  void onClose() {
    super.onClose();
  }
}

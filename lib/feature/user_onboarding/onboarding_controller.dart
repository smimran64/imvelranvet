import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final currentStep = 1.obs;
  final totalSteps = 9;
  final currentXP = 0.obs;
  final selectedCompanion = Rx<String?>(null);
  final selectedItems = <String>[].obs;
  double get progress => currentStep.value / totalSteps;
  String get progressText => '${currentStep.value}/$totalSteps';

  void nextStep() {
    if (currentStep.value < totalSteps) {
      addXP(10);
      currentStep.value++;
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

  void _navigateToStep(int step) {
    switch (step) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;

      default:
        break;
    }
  }

  void selectCompanion(String companionId) {
    selectedCompanion.value = companionId;
  }

  bool isCompanionSelected(String companionId) {
    return selectedCompanion.value == companionId;
  }

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

  void addXP(int xp) {
    currentXP.value += xp;
  }

  bool canContinue() {
    switch (currentStep.value) {
      case 1:
        return selectedCompanion.value != null;
      case 2:
        return selectedItems.isNotEmpty;

      default:
        return true;
    }
  }

  void completeOnboarding() {
    Get.offAllNamed('/home');
  }

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
 
}

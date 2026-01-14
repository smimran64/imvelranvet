// Screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/core/utils/custom/custom_background_withimage.dart';
import 'package:imvelranvet/core/utils/custom/custom_button.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding4/controller/onboarding4_controller.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding4/widgets/onboarding4_widget.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController4());

    return Scaffold(
      body: CustomBackgroundWithImage(
        imageAsset: ImagesPath.authBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                const BackButtonWidget4(),
                const SizedBox(height: 10),
                const StepsTextWidget4(),
                const SizedBox(height: 16),
                const ProgressBarWidget4(),
                const SizedBox(height: 32),
                const OnboardingHeader4Widget(),
                const SizedBox(height: 32),
                const GenderSelectionWidget(),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomButton(
                    text: 'Continue (+10 XP)',
                    onPressed: controller.onContinue,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

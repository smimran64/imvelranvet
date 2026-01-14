// Screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/core/utils/custom/custom_background_withimage.dart';
import 'package:imvelranvet/core/utils/custom/custom_button.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding3/controller/onboarding3_controller.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding3/widgets/onboarding_widget.dart';
import 'package:imvelranvet/routes/app_routes.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Onboarding3Controller());

    return Scaffold(
      body: CustomBackgroundWithImage(
        imageAsset: ImagesPath.authBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                const BackButtonWidget3(),
                const SizedBox(height: 10),
                const StepsTextWidget3(),
                const SizedBox(height: 16),
                const ProgressBarWidget3(),
                const SizedBox(height: 32),
                const OnboardingHeader3Widget(),
                const SizedBox(height: 32),
                const FitnessGoalsWidget(),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomButton(
                    text: 'Continue (+10 XP)',
                    onPressed: () => Get.toNamed(AppRoutes.onboarding4),
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

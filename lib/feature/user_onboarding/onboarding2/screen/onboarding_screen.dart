import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/core/utils/custom/custom_background_withimage.dart';
import 'package:imvelranvet/core/utils/custom/custom_button.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding2/controller/onboarding_controller.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding2/widgets/onboarding2_widget.dart';
import 'package:imvelranvet/routes/app_routes.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Onboarding2Controller());

    return Scaffold(
      body: CustomBackgroundWithImage(
        imageAsset: ImagesPath.authBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BackButtonWidget(),
                const SizedBox(height: 10),
                const StepsTextWidget2(),
                const SizedBox(height: 16),
                const ProgressBarWidget2(),
                const SizedBox(height: 24),
                const SetupTextWidget(),
                const SizedBox(height: 8),
                const ProfileSetupWidget(),
                const SizedBox(height: 24),

                CustomButton(
                  text: 'Continue (+${controller.xpPoints.value} XP)',
                  width: 343,
                  height: 50,
                  onPressed: () => Get.toNamed(AppRoutes.onboarding3),
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/core/utils/custom/custom_background_withimage.dart';
import 'package:imvelranvet/core/utils/custom/custom_button.dart';
import 'package:imvelranvet/core/utils/custom/custom_back_button.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding7/controller/onboarding7_controller.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding7/widgets/onboarding7_widget.dart';
import 'package:imvelranvet/routes/app_routes.dart';

class OnboardingScreen7 extends StatelessWidget {
  const OnboardingScreen7({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController7());

    return Scaffold(
      body: CustomBackgroundWithImage(
        imageAsset: ImagesPath.authBackground,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    const StepsTextWidget7(),
                    const SizedBox(height: 8),
                    const ProgressBarWidget7(),
                    const SizedBox(height: 40),
                    const OnboardingHeaderWidget7(),
                    const SizedBox(height: 40),
                    const MoodSelectionWidget(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomButton(
                        text: 'Continue (+10 XP)',
                        onPressed: () => Get.toNamed(AppRoutes.onboarding8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 12,
              left: 24,
              child: FigmaBackButton(onPressed: () => Get.back()),
            ),
          ],
        ),
      ),
    );
  }
}

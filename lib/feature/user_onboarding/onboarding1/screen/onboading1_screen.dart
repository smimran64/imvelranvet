import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/core/utils/custom/custom_background_withimage.dart';
import 'package:imvelranvet/core/utils/custom/custom_button.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding1/controller/onboarding1_controller.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding1/widgets/onboarding1_widget.dart';
import 'package:imvelranvet/routes/app_routes.dart';

class ThemeCompanionScreen extends StatelessWidget {
  const ThemeCompanionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeCompanionController());

    return Scaffold(
      body: CustomBackgroundWithImage(
        imageAsset: ImagesPath.authBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopBarWidget(),
                const SizedBox(height: 10),
                const StepsTextWidget(),
                const ProgressBarWidget(),
                const SizedBox(height: 20),
                const TitleSection(),
                const SizedBox(height: 24),

                // 👇 LIST (NOT Expanded)
                Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: controller.companions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CompanionCard(
                        companion: controller.companions[index],
                        isSelected: controller.selectedIndex.value == index,
                        onTap: () => controller.selectCompanion(index),
                        onUnlock: () => controller.unlockCompanion(index),
                        isUnlocked: controller.isCompanionUnlocked(index),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Obx(
                    () => CustomButton(
                      text: 'Continue (+${controller.xpPoints.value} XP)',
                      onPressed: () => Get.toNamed(AppRoutes.onboarding2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

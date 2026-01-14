import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/core/utils/custom/custom_background_withimage.dart';
import 'package:imvelranvet/core/utils/custom/custom_button.dart';
import 'package:imvelranvet/feature/welcome_boarding/controller/user_boarding_controller.dart';
import 'package:imvelranvet/feature/welcome_boarding/widgets/user_boarding_widget.dart';
import 'package:imvelranvet/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeController());

    return Scaffold(
      body: CustomBackgroundWithImage(
        imageAsset: ImagesPath.authBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 285),

                const WelcomeTitle(),

                const SizedBox(height: 24),

                const WelcomeDescription(),

                const SizedBox(height: 40),

                // Button
                CustomButton(
                  text: 'Continue Journey',
                  width: 252,
                  onPressed: () => Get.toNamed(AppRoutes.onboarding1),
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

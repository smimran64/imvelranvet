import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/core/utils/custom/custom_background_withimage.dart';
import 'package:imvelranvet/core/utils/custom/custom_button.dart';
import 'package:imvelranvet/feature/welcome_boarding/controller/user_boarding_controller.dart';
import 'package:imvelranvet/feature/welcome_boarding/widgets/user_boarding_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());

    return Scaffold(
      body: CustomBackgroundWithImage(
        imageAsset: ImagesPath.authBackground, // Your celestial image path
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 285),

                // Title
                const WelcomeTitle(),

                const SizedBox(height: 24),

                // Description
                const WelcomeDescription(),

                const SizedBox(height: 40),

                // Button
                CustomButton(
                  text: 'Continue Journey',
                  width: 252,
                  onPressed: controller.onContinuePressed,
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

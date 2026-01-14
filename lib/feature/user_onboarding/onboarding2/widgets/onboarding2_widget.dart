import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:imvelranvet/core/common/styles/global_text_style.dart';
import 'package:imvelranvet/core/utils/constand/images_path.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding2/controller/onboarding_controller.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Onboarding2Controller>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          // Back Button
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: controller.onBackPressed,
          ),
        ],
      ),
    );
  }
}

class StepsTextWidget2 extends StatelessWidget {
  const StepsTextWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Onboarding2Controller>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Steps 2/9',
            style: getTextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Text(
            '+10 XP',
            style: getTextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBarWidget2 extends StatelessWidget {
  const ProgressBarWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Onboarding2Controller>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 6,
            child: Stack(
              children: [
                // Background
                Container(color: Colors.white.withOpacity(0.2)),

                // Progress with Gradient
                FractionallySizedBox(
                  widthFactor: controller.progressValue,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFDE7BB),
                          Color(0xFF9E6D38),
                          Color(0xFFE9B86E),
                          Color(0xFFE5B46B),
                        ],
                      ),
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

class SetupTextWidget extends StatelessWidget {
  const SetupTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),

      child: Column(
        children: [
          Text(
            "Setup Your Profile",
            textAlign: TextAlign.center,
            style: getTextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class ProfileSetupWidget extends StatelessWidget {
  const ProfileSetupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Onboarding2Controller>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),

          // Profile Label
          Text(
            'Profile:',
            style: getTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: SizedBox(
              width: 160,
              height: 140,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Profile Image Circle
                  Positioned(
                    top: 0,
                    left: -90,
                    child: Obx(
                      () => Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFE9B86E),
                            width: 2,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: controller.profileImage.value != null
                                // Picked image
                                ? FileImage(controller.profileImage.value!)
                                // Default asset image
                                : const AssetImage(ImagesPath.profile)
                                      as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Upload Button
                  Positioned(
                    top: 80,
                    left: -90,
                    child: GestureDetector(
                      onTap: controller.pickImage,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFDE7BB),
                              Color(0xFF9E6D38),
                              Color(0xFFE9B86E),
                              Color(0xFF9D6933),
                              Color(0xFFFEE9BF),
                              Color(0xFF683E23),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Upload profile image',
                              style: getTextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          // Your Name Label
          Text(
            'Your Name:',
            style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 12),

          // Name Input Field
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),              
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: TextField(
              controller: controller.nameController,
              style: getTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: 'Enter your name',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

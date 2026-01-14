import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:imvelranvet/core/common/styles/global_text_style.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding4/controller/onboarding4_controller.dart';

class BackButtonWidget4 extends StatelessWidget {
  const BackButtonWidget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController4>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
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
class StepsTextWidget4 extends StatelessWidget {
  const StepsTextWidget4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Steps 4 / 9',
            style: getTextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '+10 XP',
            style: getTextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBarWidget4 extends StatelessWidget {
  const ProgressBarWidget4({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController4>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 6,
            child: Stack(
              children: [
                Container(color: Colors.white.withOpacity(0.2)),
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

class OnboardingHeader4Widget extends StatelessWidget {
  const OnboardingHeader4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "What is your gender?",
        textAlign: TextAlign.center,
        style: getTextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController4>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
          controller.genders.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Obx(() {
              final isSelected = controller.selectedGender.value == index;

              return GestureDetector(
                onTap: () => controller.selectGender(index),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF521212).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF6B1717)
                          : Colors.white.withOpacity(0.1),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Custom Radio Icon
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFFE9B86E),
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFFDE7BB),
                                        Color(0xFF9E6D38),
                                        Color(0xFFE9B86E),
                                        Color(0xFFE5B46B),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          controller.genders[index],
                          style: getTextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}


// Widgets
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/common/styles/global_text_style.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding3/controller/onboarding3_controller.dart';

class BackButtonWidget3 extends StatelessWidget {
  const BackButtonWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Onboarding3Controller>();
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

class StepsTextWidget3 extends StatelessWidget {
  const StepsTextWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Steps 3 / 9',
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

class ProgressBarWidget3 extends StatelessWidget {
  const ProgressBarWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Onboarding3Controller>();

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

class OnboardingHeader3Widget extends StatelessWidget {
  const OnboardingHeader3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "What's your fitness goal/\ntarget?",
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

class FitnessGoalsWidget extends StatelessWidget {
  const FitnessGoalsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Onboarding3Controller>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
          controller.goals.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Obx(() {
              final isSelected = controller.selectedGoal.value == index;

              return GestureDetector(
                onTap: () => controller.selectGoal(index),
                child: Container(
                  width: 343,
                  height: 52,
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

                            width: 3,
                          ),
                        ),
                        child: isSelected
                            ? Padding(
                                padding: const EdgeInsets.all(2.50),
                                child: Center(
                                  child: Container(
                                    width: 15.44,
                                    height: 15.44,
                                    decoration: BoxDecoration(
                                      // shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(6),
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFFFDE7BB),
                                          const Color(0xFF9E6D38),
                                          const Color(0xFFE9B86E),
                                          const Color(0xFFE5B46B),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          controller.goals[index],
                          style: getTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.9),
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

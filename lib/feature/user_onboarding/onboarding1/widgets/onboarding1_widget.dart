import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imvelranvet/core/common/styles/global_text_style.dart';
import 'package:imvelranvet/feature/user_onboarding/onboarding1/controller/onboarding1_controller.dart';

// Top Bar Widget with Back Button
class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeCompanionController>();

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

class StepsTextWidget extends StatelessWidget {
  const StepsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ThemeCompanionController>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Steps 1/9',
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

// Progress Bar Widget
class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeCompanionController>();

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
                // ignore: deprecated_member_use
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

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'Choose a theme companion',
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'It is kind of your personal assistant who keep you mobilize everything. Still you can changes it later from settings.',
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}

class CompanionCard extends StatelessWidget {
  final CompanionModel companion;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onUnlock;
  final bool isUnlocked;

  const CompanionCard({
    super.key,
    required this.companion,
    required this.isSelected,
    required this.onTap,
    required this.onUnlock,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: isSelected ? const EdgeInsets.all(2) : EdgeInsets.zero,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    Color(0xFFFDE7BB),
                    Color(0xFF9E6D38),
                    Color(0xFFE9B86E),
                    Color(0xFFE5B46B),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 168,
          decoration: BoxDecoration(
            gradient: companion.bgGradient,
            borderRadius: BorderRadius.circular(16),
            border: !isSelected
                // ignore: deprecated_member_use
                ? Border.all(color: Colors.white.withOpacity(0.2), width: 1)
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Row(children: [_buildLeftContent(), _buildRightImage()]),
          ),
        ),
      ),
    );
  }

  /// Left side with text content
  Widget _buildLeftContent() {
    return Expanded(
      flex: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Selection Indicator
            _buildSelectionIndicator(),

            const SizedBox(height: 8),

            /// Name
            Text(
              companion.name,
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFFFFF),
              ),
            ),

            const SizedBox(height: 4),

            /// Title
            Text(
              companion.title,
              style: getTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFFFFF),
              ),
            ),

            const Spacer(),

            /// ACTIVE / UNLOCK STATE
            if (companion.isActive && companion.theme.isNotEmpty)
              _buildActiveBadge()
            else if (!isUnlocked && companion.unlockXp != null)
              _buildUnlockButton(),
          ],
        ),
      ),
    );
  }

  /// Right side with image stack
  Widget _buildRightImage() {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(companion.bgImage, fit: BoxFit.cover),
          ),
          Center(
            child: Image.asset(
              companion.imagePath,
              width: 102,
              height: 143,
              fit: BoxFit
                  .contain, 
            ),
          ),
        ],
      ),
    );
  }

  /// Selection indicator circle
  Widget _buildSelectionIndicator() {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(179, 238, 221, 158),
          width: 2,
        ),
        color: isSelected
            ? const Color.fromARGB(255, 249, 249, 249)
            : Colors.transparent,
      ),
    );
  }

  /// Active badge
  Widget _buildActiveBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFF410404),
        borderRadius: BorderRadius.circular(29),
        
      ),
      child: Text(
        companion.theme,
        style: getTextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }

  /// Unlock button
  Widget _buildUnlockButton() {
    return GestureDetector(
      onTap: onUnlock,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white38),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unlock ${companion.unlockXp} xp',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.lock_outline, size: 14, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

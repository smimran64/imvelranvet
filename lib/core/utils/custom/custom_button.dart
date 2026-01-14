import 'package:flutter/material.dart';
import 'package:imvelranvet/core/common/styles/global_text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.only(
          top: 11,
          right: 44,
          bottom: 11,
          left: 44,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // ignore: deprecated_member_use
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFDE7BB),
              Color(0xFF9E6D38),
              Color(0xFFE9B86E),
              Color(0xFF9D6933),
              Color(0xFFFEE9BF),
              Color(0xFF683E23),
            ],
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: getTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}

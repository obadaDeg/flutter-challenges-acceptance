import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Color bgColor;
  final Color frColor;

  const MainButton({
    super.key,
    this.title,
    required this.onPressed,
    this.bgColor = AppColors.primary,
    this.frColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: frColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed,
        child: Text(title ?? ''),
      ),
    );
  }
}

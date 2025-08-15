import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.rw),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.rw),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF001EE6),
                Color(0xFF031BBB),
                Color(0xFF0117AF),
                Color(0xFF00138F),
              ],
              stops: [0.0, 0.3317, 0.6587, 1.0],
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.rh),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: AppTextStyles.displaySmall.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(width: 15.rw),
                Image.asset(
                  AppAssets.rightArrowIcon,
                  height: 20.rh,
                  width: 20.rw,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

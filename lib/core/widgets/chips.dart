// import 'package:flutter/material.dart';
// import 'package:flutter_assignment3/core/theme/app_colors.dart';
// import 'package:flutter_assignment3/core/theme/app_text_styles.dart';

// class Chips extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final double horizontalPadding;
//   final double verticalPadding;

//   const Chips({
//     required this.label,
//     this.isSelected = false,
//     this.horizontalPadding = 20, // default value
//     this.verticalPadding = 12, // default value
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       showCheckmark: false, // ✅ Remove the default checkmark
//       onSelected: (bool selected) {
//         // Add selection logic here if needed
//       },
//       labelStyle: AppTextStyles.labelLarge.copyWith(
//         color: isSelected ? AppColors.gray800 : AppColors.gray600,
//         fontSize: 16,
//       ),
//       selectedColor: AppColors.accentBlue,
//       backgroundColor: AppColors.white,
//       shape: StadiumBorder(
//         side: BorderSide(
//           color: isSelected ? AppColors.secondary : AppColors.gray400,
//           width: 1,
//         ),
//       ),
//       padding: EdgeInsets.symmetric(
//         horizontal: horizontalPadding,
//         vertical: verticalPadding,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';

class Chips extends StatelessWidget {
  final String label;
  final bool isSelected;
  final double horizontalPadding;
  final double verticalPadding;
  final VoidCallback? onTap;

  const Chips({
    required this.label,
    this.isSelected = false,
    this.horizontalPadding = 8, // default value
    this.verticalPadding = 5, // default value
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: AppTextStyles.labelLarge.copyWith(
          color: isSelected ? AppColors.gray800 : AppColors.gray600,
          fontSize: 16.sp, // responsive font size
        ),
      ),
      selected: isSelected,
      showCheckmark: false,
      onSelected: (bool selected) {
        if (onTap != null) {
          onTap!();
        }
      },
      selectedColor: AppColors.accentBlue,
      backgroundColor: AppColors.white,
      shape: StadiumBorder(
        side: BorderSide(
          color: isSelected ? AppColors.secondary : AppColors.gray400,
          width: 1.rw, // responsive border width
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.rw,
        vertical: verticalPadding.rh,
      ),
    );
  }
}

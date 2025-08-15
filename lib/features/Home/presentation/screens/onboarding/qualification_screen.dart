// import 'package:flutter/material.dart';
// import 'package:flutter_assignment3/core/constants/app_assets.dart';
// import 'package:flutter_assignment3/core/theme/app_colors.dart';
// import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
// import 'package:flutter_assignment3/core/widgets/custom_button.dart';
// import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

// class EducationalBackgroundScreen extends StatefulWidget {
//   final VoidCallback? onBack;
//   final int currentPage;
//   final int totalPages;

//   const EducationalBackgroundScreen({
//     super.key,
//     this.onBack,
//     required this.currentPage,
//     required this.totalPages,
//   });

//   @override
//   State<EducationalBackgroundScreen> createState() =>
//       _EducationalBackgroundScreenState();
// }

// class _EducationalBackgroundScreenState
//     extends State<EducationalBackgroundScreen> {
//   String selectedOption = "Graduate";

//   void selectOption(String option) {
//     setState(() {
//       selectedOption = option;
//     });
//   }

//   final List<Map<String, String>> options = [
//     {
//       "title": "10th/12th Pass",
//       "subtitle": "Secondary Education",
//       "image": AppAssets.school,
//     },
//     {
//       "title": "ITI/Diploma",
//       "subtitle": "Technical Education",
//       "image": AppAssets.diploma,
//     },
//     {
//       "title": "Graduate",
//       "subtitle": "Bachelor's Degree",
//       "image": AppAssets.graduate,
//     },
//     {
//       "title": "Post Graduate",
//       "subtitle": "Master's Degree",
//       "image": AppAssets.postGraduate,
//     },
//     {
//       "title": "Professional Course",
//       "subtitle": "Specialized Training",
//       "image": AppAssets.professionalCourse,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: IntroAppBar(
//         title: "What's your educational background?",
//         subtitle: "This helps companies get a better sense of your background.",
//         currentPage: widget.currentPage,
//         totalPages: widget.totalPages,
//         onBack: widget.onBack,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
//           ),
//           child: IntrinsicHeight(
//             child: Column(
//               children: [
//                 // List of educational options
//                 for (var option in options)
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 12),
//                     child: _buildOption(
//                       title: option["title"]!,
//                       subtitle: option["subtitle"]!,
//                       imagePath: option["image"]!,
//                     ),
//                   ),

//                 Spacer(), // pushes button to the bottom
//                 // Next button
//                 CustomButton(
//                   text: "Next : Your Skills",
//                   onPressed: () {
//                     // Navigate to next screen
//                   },
//                 ),
//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOption({
//     required String title,
//     required String subtitle,
//     required String imagePath,
//   }) {
//     final bool isSelected = selectedOption == title;

//     return GestureDetector(
//       onTap: () => selectOption(title),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: isSelected ? AppColors.secondary : AppColors.gray400,
//             width: isSelected ? 2 : 1,
//           ),
//           color: isSelected
//               ? AppColors.accentBlue.withOpacity(0.5)
//               : AppColors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//           child: Row(
//             children: [
//               Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? AppColors.white
//                       : AppColors.accentBlue, // background color for the square
//                   borderRadius: BorderRadius.circular(8), // small radius
//                 ),
//                 child: Center(
//                   child: Image.asset(imagePath, height: 24, width: 24),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: AppTextStyles.labelLarge.copyWith(
//                         fontSize: 16,
//                         color: AppColors.gray600,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       subtitle,
//                       style: AppTextStyles.bodySmall.copyWith(
//                         fontSize: 14,
//                         color: AppColors.gray600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Radio<String>(
//                 value: title,
//                 groupValue: selectedOption,
//                 activeColor: AppColors.secondary,
//                 onChanged: (value) => selectOption(value!),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class EducationalBackgroundScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const EducationalBackgroundScreen({
    super.key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  State<EducationalBackgroundScreen> createState() =>
      _EducationalBackgroundScreenState();
}

class _EducationalBackgroundScreenState
    extends State<EducationalBackgroundScreen> {
  String selectedOption = "Graduate";

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  final List<Map<String, String>> options = [
    {
      "title": "10th/12th Pass",
      "subtitle": "Secondary Education",
      "image": AppAssets.school,
    },
    {
      "title": "ITI/Diploma",
      "subtitle": "Technical Education",
      "image": AppAssets.diploma,
    },
    {
      "title": "Graduate",
      "subtitle": "Bachelor's Degree",
      "image": AppAssets.graduate,
    },
    {
      "title": "Post Graduate",
      "subtitle": "Master's Degree",
      "image": AppAssets.postGraduate,
    },
    {
      "title": "Professional Course",
      "subtitle": "Specialized Training",
      "image": AppAssets.professionalCourse,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "What's your educational background?",
        subtitle: "This helps companies get a better sense of your background.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
      ),
      body: Padding(
        padding: 16.allPadding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                for (var option in options)
                  Padding(
                    padding: 12.onlyPadding(bottom: 12),
                    child: _buildOption(
                      title: option["title"]!,
                      subtitle: option["subtitle"]!,
                      imagePath: option["image"]!,
                    ),
                  ),

                Spacer(),

                CustomButton(text: "Next : Your Skills", onPressed: () {}),
                30.vSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    final bool isSelected = selectedOption == title;

    return GestureDetector(
      onTap: () => selectOption(title),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.rw),
          border: Border.all(
            color: isSelected ? AppColors.secondary : AppColors.gray400,
            width: isSelected ? 2.rw : 1.rw,
          ),
          color: isSelected
              ? AppColors.accentBlue.withOpacity(0.5)
              : AppColors.white,
        ),
        child: Padding(
          padding: 16.symmetricPadding(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Container(
                height: 40.rh,
                width: 40.rw,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.white : AppColors.accentBlue,
                  borderRadius: BorderRadius.circular(8.rw),
                ),
                child: Center(
                  child: Image.asset(imagePath, height: 24.rh, width: 24.rw),
                ),
              ),
              16.hSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.labelLarge.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.gray600,
                      ),
                    ),
                    4.vSpace,
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.gray600,
                      ),
                    ),
                  ],
                ),
              ),
              Radio<String>(
                value: title,
                groupValue: selectedOption,
                activeColor: AppColors.secondary,
                onChanged: (value) => selectOption(value!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

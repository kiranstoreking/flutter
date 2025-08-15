// import 'package:flutter/material.dart';
// import 'package:flutter_assignment3/core/constants/app_assets.dart';
// import 'package:flutter_assignment3/core/theme/app_colors.dart';
// import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
// import 'package:flutter_assignment3/core/widgets/chips.dart';
// import 'package:flutter_assignment3/core/widgets/custom_button.dart';
// import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

// class SkillsScreen extends StatelessWidget {
//   final VoidCallback? onBack;
//   final int currentPage;
//   final int totalPages;

//   const SkillsScreen({
//     super.key,
//     this.onBack,
//     required this.currentPage,
//     required this.totalPages,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: IntroAppBar(
//         title: "What are you great at?",
//         subtitle:
//             "Select your top skills so the right companies\ncan find you.",
//         currentPage: currentPage,
//         totalPages: totalPages,
//         onBack: onBack,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),

//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: 'Search your skills',
//                 hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
//                 prefixIcon: Container(
//                   padding: const EdgeInsets.all(
//                     12,
//                   ), // icon padding inside square
//                   child: Image.asset(AppAssets.search, height: 18, width: 18),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 contentPadding: const EdgeInsets.all(20),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     color: Colors.grey.shade300,
//                   ), // single color
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.grey.shade300),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     color: Colors.grey.shade300,
//                   ), // same as others
//                 ),
//               ),
//               style: TextStyle(
//                 fontSize: 14,
//                 color: const Color.fromRGBO(0, 0, 0, 0.867),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Image.asset(AppAssets.circle, height: 10, width: 10),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Select at least 3',
//                   style: AppTextStyles.labelLarge.copyWith(
//                     color: AppColors.gray600,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 Chips(label: 'UI/UX Design'),
//                 Chips(label: 'Product Design', isSelected: true),
//                 Chips(label: 'Marketing'),
//                 Chips(label: 'Animation'),
//                 Chips(label: 'Full stack Developer', isSelected: true),
//                 Chips(label: 'Branding'),
//                 Chips(label: 'Data Analytics'),
//                 Chips(label: 'Frontend Development'),
//                 Chips(label: 'Graphic Design'),
//               ],
//             ),
//             const Spacer(),
//             CustomButton(
//               text: "Find My Matches",
//               onPressed: () {
//                 // Action for next button
//               },
//             ),
//             const SizedBox(height: 30),
//           ],
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
import 'package:flutter_assignment3/core/widgets/chips.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class SkillsScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const SkillsScreen({
    super.key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "What are you great at?",
        subtitle:
            "Select your top skills so the right companies\ncan find you.",
        currentPage: currentPage,
        totalPages: totalPages,
        onBack: onBack,
      ),
      body: Padding(
        padding: 15.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.vSpace,
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search your skills',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14.sp,
                ),
                prefixIcon: Container(
                  padding: 12.symmetricPadding(),
                  child: Image.asset(
                    AppAssets.search,
                    height: 18.rh,
                    width: 18.rw,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: 20.symmetricPadding(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.rw),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.rw),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.rw),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color.fromRGBO(0, 0, 0, 0.867),
              ),
            ),
            16.vSpace,
            Row(
              children: [
                Image.asset(AppAssets.circle, height: 10.rh, width: 10.rw),
                8.hSpace,
                Text(
                  'Select at least 3',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.gray600,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            16.vSpace,
            Wrap(
              spacing: 10.rw,
              runSpacing: 10.rh,
              children: [
                Chips(label: 'UI/UX Design'),
                Chips(label: 'Product Design', isSelected: true),
                Chips(label: 'Marketing'),
                Chips(label: 'Animation'),
                Chips(label: 'Full stack Developer', isSelected: true),
                Chips(label: 'Branding'),
                Chips(label: 'Data Analytics'),
                Chips(label: 'Frontend Development'),
                Chips(label: 'Graphic Design'),
              ],
            ),
            const Spacer(),
            CustomButton(
              text: "Find My Matches",
              onPressed: () {
                // Action for next button
              },
            ),
            30.vSpace,
          ],
        ),
      ),
    );
  }
}

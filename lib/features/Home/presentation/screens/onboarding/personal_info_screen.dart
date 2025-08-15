// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // for formatting date
// import 'package:flutter_assignment3/core/constants/app_assets.dart';
// import 'package:flutter_assignment3/core/theme/app_colors.dart';
// import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
// import 'package:flutter_assignment3/core/widgets/custom_button.dart';
// import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

// class UserInfoScreen extends StatefulWidget {
//   final VoidCallback? onBack;
//   final int currentPage;
//   final int totalPages;

//   const UserInfoScreen({
//     Key? key,
//     this.onBack,
//     required this.currentPage,
//     required this.totalPages,
//   }) : super(key: key);

//   @override
//   State<UserInfoScreen> createState() => _UserInfoScreenState();
// }

// class _UserInfoScreenState extends State<UserInfoScreen> {
//   String? _selectedGender;
//   DateTime? _selectedDate;

//   InputDecoration _inputDecoration({required String hint, Widget? suffixIcon}) {
//     return InputDecoration(
//       hintText: hint,
//       hintStyle: AppTextStyles.titleSmall.copyWith(color: Colors.grey),
//       filled: true,
//       fillColor: Colors.white,
//       suffixIcon: suffixIcon,
//       contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide(color: AppColors.gray400),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.gray400, width: 1.5),
//       ),
//     );
//   }

//   Future<void> _pickDateOfBirth() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime(2000, 1, 1),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             dialogBackgroundColor: Colors.white,
//             colorScheme: ColorScheme.light(
//               primary: AppColors.primary, // Header background color
//               onPrimary: Colors.white, // Header text color
//               onSurface: Colors.black, // Body text color
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: AppColors.primary, // Button text color
//               ),
//             ),
//           ),
//           child: Center(
//             // makes it smaller
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 350, maxHeight: 500),
//               child: child!,
//             ),
//           ),
//         );
//       },
//     );

//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: IntroAppBar(
//         title: "Hey there! Let's get to know you.",
//         subtitle:
//             "This helps us find jobs that are a perfect fit,\njust for you.",
//         currentPage: widget.currentPage,
//         totalPages: widget.totalPages,
//         onBack: widget.onBack,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _labelWithAsterisk("First Name"),
//                   const SizedBox(height: 8),
//                   TextField(
//                     cursorColor: Colors.grey,
//                     decoration: _inputDecoration(hint: 'Enter your first name'),
//                   ),
//                   const SizedBox(height: 20),

//                   _labelWithAsterisk("Last Name"),
//                   const SizedBox(height: 8),
//                   TextField(
//                     cursorColor: Colors.grey,
//                     decoration: _inputDecoration(hint: 'Enter your last name'),
//                   ),
//                   const SizedBox(height: 20),

//                   _labelWithAsterisk("Gender"),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       _genderOption(AppAssets.femaleIcon, "Male"),
//                       _genderOption(AppAssets.maleIcon, "Female"),
//                       _genderOption(AppAssets.otherIcon, "Other"),
//                     ],
//                   ),
//                   const SizedBox(height: 20),

//                   _labelWithAsterisk("Date of Birth"),
//                   const SizedBox(height: 8),
//                   TextField(
//                     cursorColor: Colors.grey,
//                     readOnly: true,
//                     controller: TextEditingController(
//                       text: _selectedDate != null
//                           ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
//                           : '',
//                     ),
//                     decoration: _inputDecoration(
//                       hint: 'Select your date of birth',
//                       suffixIcon: const Icon(
//                         Icons.calendar_today,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     onTap: _pickDateOfBirth,
//                   ),
//                 ],
//               ),
//             ),
//             // ),
//             Spacer(),
//             CustomButton(text: "Let’s Begin", onPressed: () {}),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _labelWithAsterisk(String label) {
//     return RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: label,
//             style: AppTextStyles.titleSmall.copyWith(color: AppColors.gray700),
//           ),
//           TextSpan(
//             text: " *",
//             style: AppTextStyles.titleSmall.copyWith(color: AppColors.error),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _genderOption(String iconPath, String label) {
//     final bool isSelected = _selectedGender == label;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             _selectedGender = label;
//           });
//         },
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 4),
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           decoration: BoxDecoration(
//             color: isSelected ? AppColors.accentBlue : Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: isSelected ? AppColors.secondary : Colors.grey.shade300,
//               width: 1.5,
//             ),
//           ),
//           child: Column(
//             children: [
//               Image.asset(iconPath, height: 24, width: 24),
//               const SizedBox(height: 6),
//               Text(
//                 label,
//                 style: AppTextStyles.titleSmall.copyWith(
//                   color: AppColors.gray700,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:intl/intl.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class UserInfoScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const UserInfoScreen({
    Key? key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? _selectedGender;
  DateTime? _selectedDate;

  InputDecoration _inputDecoration({required String hint, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.titleSmall.copyWith(
        color: Colors.grey,
        fontSize: 14.sp,
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      contentPadding: 16.symmetricPadding(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.rw)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.rw),
        borderSide: BorderSide(color: AppColors.gray400, width: 1.rw),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.rw),
        borderSide: BorderSide(color: AppColors.gray400, width: 1.5.rw),
      ),
    );
  }

  Future<void> _pickDateOfBirth() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 350.rw, maxHeight: 500.rh),
              child: child!,
            ),
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "Hey there! Let's get to know you.",
        subtitle:
            "This helps us find jobs that are a perfect fit,\njust for you.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
      ),
      resizeToAvoidBottomInset: false, // important
      body: Padding(
        padding: 16.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _labelWithAsterisk("First Name"),
                    8.vSpace,
                    TextField(
                      cursorColor: Colors.grey,
                      decoration: _inputDecoration(
                        hint: 'Enter your first name',
                      ),
                    ),
                    20.vSpace,

                    _labelWithAsterisk("Last Name"),
                    8.vSpace,
                    TextField(
                      cursorColor: Colors.grey,
                      decoration: _inputDecoration(
                        hint: 'Enter your last name',
                      ),
                    ),
                    20.vSpace,

                    _labelWithAsterisk("Gender"),
                    8.vSpace,
                    Row(
                      children: [
                        _genderOption(AppAssets.maleIcon, "Male"),
                        _genderOption(AppAssets.femaleIcon, "Female"),
                        _genderOption(AppAssets.otherIcon, "Other"),
                      ],
                    ),
                    20.vSpace,

                    _labelWithAsterisk("Date of Birth"),
                    8.vSpace,
                    TextField(
                      cursorColor: Colors.grey,
                      readOnly: true,
                      controller: TextEditingController(
                        text: _selectedDate != null
                            ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                            : '',
                      ),
                      decoration: _inputDecoration(
                        hint: 'Select your date of birth',
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 20.rw,
                        ),
                      ),
                      onTap: _pickDateOfBirth,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(text: "Let’s Begin", onPressed: () {}),
            30.vSpace,
          ],
        ),
      ),
    );
  }

  Widget _labelWithAsterisk(String label) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.gray700,
              fontSize: 14.sp,
            ),
          ),
          TextSpan(
            text: " *",
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.error,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _genderOption(String iconPath, String label) {
    final bool isSelected = _selectedGender == label;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedGender = label;
          });
        },
        child: Container(
          margin: 4.symmetricPadding(horizontal: 4),
          padding: 12.symmetricPadding(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.accentBlue : Colors.white,
            borderRadius: BorderRadius.circular(12.rw),
            border: Border.all(
              color: isSelected ? AppColors.secondary : Colors.grey.shade300,
              width: 1.5.rw,
            ),
          ),
          child: Column(
            children: [
              Image.asset(iconPath, height: 24.rh, width: 24.rw),
              6.vSpace,
              Text(
                label,
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.gray700,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

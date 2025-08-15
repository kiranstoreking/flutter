import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';
import 'package:flutter_assignment3/core/services/local_storage_service.dart';

class EducationalBackgroundScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onNext;

  const EducationalBackgroundScreen({
    super.key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
    this.onNext,
  });

  @override
  State<EducationalBackgroundScreen> createState() =>
      _EducationalBackgroundScreenState();
}

class _EducationalBackgroundScreenState
    extends State<EducationalBackgroundScreen> {
  String? selectedOption;
  String? _validationError;

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
      _validationError = null; // Clear error when option is selected
    });
  }

  // Form validation
  bool _validateForm() {
    if (selectedOption == null) {
      setState(() {
        _validationError = 'Please select your educational background';
      });
      return false;
    }
    return true;
  }

  // Handle next button press
  void _handleNext() async {
    if (_validateForm()) {
      // Save data to local storage
      final localStorage = await LocalStorageService.getInstance();
      await localStorage.saveQualification(selectedOption!);

      // Pass to next screen
      if (widget.onNext != null) {
        widget.onNext!();
      }
    }
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
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: 16.allPadding,
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

                  if (_validationError != null) ...[
                    8.vSpace,
                    Text(
                      _validationError!,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.error,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Fixed button at bottom
          Container(
            padding: 16.allPadding,
            child: CustomButton(
              text: "Next : Your Skills",
              onPressed: _handleNext,
            ),
          ),
          30.vSpace,
        ],
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
              ? AppColors.accentBlue.withOpacity(0.1)
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
                        color: isSelected
                            ? AppColors.secondary
                            : AppColors.gray600,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    4.vSpace,
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 14.sp,
                        color: isSelected
                            ? AppColors.secondary.withOpacity(0.8)
                            : AppColors.gray600,
                      ),
                    ),
                  ],
                ),
              ),
              // Custom Radio Button with outline that fills
              Container(
                width: 24.rw,
                height: 24.rh,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.secondary : AppColors.gray400,
                    width: 2.rw,
                  ),
                  color: isSelected ? AppColors.secondary : Colors.transparent,
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 8.rw,
                          height: 8.rh,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

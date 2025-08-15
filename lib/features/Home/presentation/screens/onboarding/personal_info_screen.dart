import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:intl/intl.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';
import 'package:flutter_assignment3/core/services/local_storage_service.dart';

class UserInfoScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onNext;
  final VoidCallback? onNameSaved;

  const UserInfoScreen({
    Key? key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
    this.onNext,
    this.onNameSaved,
  }) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? _selectedGender;
  DateTime? _selectedDate;

  // Form controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // Form validation keys
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Error messages
  String? _firstNameError;
  String? _lastNameError;
  String? _genderError;
  String? _dateOfBirthError;

  InputDecoration _inputDecoration({
    required String hint,
    Widget? suffixIcon,
    String? errorText,
  }) {
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.rw),
        borderSide: BorderSide(color: AppColors.error, width: 1.rw),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.rw),
        borderSide: BorderSide(color: AppColors.error, width: 1.5.rw),
      ),
      errorText: errorText,
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
        _dateOfBirthError = null;
      });
    }
  }

  // Form validation
  bool _validateForm() {
    bool isValid = true;

    // Clear previous errors
    setState(() {
      _firstNameError = null;
      _lastNameError = null;
      _genderError = null;
      _dateOfBirthError = null;
    });

    // Validate first name
    if (_firstNameController.text.trim().isEmpty) {
      setState(() {
        _firstNameError = 'First name is required';
      });
      isValid = false;
    } else if (_firstNameController.text.trim().length < 2) {
      setState(() {
        _firstNameError = 'First name must be at least 2 characters';
      });
      isValid = false;
    }

    // Validate last name
    if (_lastNameController.text.trim().isEmpty) {
      setState(() {
        _lastNameError = 'Last name is required';
      });
      isValid = false;
    } else if (_lastNameController.text.trim().length < 2) {
      setState(() {
        _lastNameError = 'Last name must be at least 2 characters';
      });
      isValid = false;
    }

    // Validate gender
    if (_selectedGender == null) {
      setState(() {
        _genderError = 'Please select your gender';
      });
      isValid = false;
    }

    // Validate date of birth
    if (_selectedDate == null) {
      setState(() {
        _dateOfBirthError = 'Please select your date of birth';
      });
      isValid = false;
    }

    return isValid;
  }

  // Handle next button press
  void _handleNext() async {
    if (_validateForm()) {
      // Save data to local storage
      final localStorage = await LocalStorageService.getInstance();
      await localStorage.saveFirstName(_firstNameController.text.trim());
      await localStorage.saveLastName(_lastNameController.text.trim());
      await localStorage.saveGender(_selectedGender!);
      await localStorage.saveDateOfBirth(
        DateFormat('dd/MM/yyyy').format(_selectedDate!),
      );

      // Notify parent that name was saved
      if (widget.onNameSaved != null) {
        widget.onNameSaved!();
      }

      // Pass to next screen
      if (widget.onNext != null) {
        widget.onNext!();
      }
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: 16.allPadding,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _labelWithAsterisk("First Name"),
                        8.vSpace,
                        TextField(
                          controller: _firstNameController,
                          cursorColor: Colors.grey,
                          decoration: _inputDecoration(
                            hint: 'Enter your first name',
                            errorText: _firstNameError,
                          ),
                          onChanged: (value) {
                            if (_firstNameError != null) {
                              setState(() {
                                _firstNameError = null;
                              });
                            }
                          },
                        ),
                        20.vSpace,

                        _labelWithAsterisk("Last Name"),
                        8.vSpace,
                        TextField(
                          controller: _lastNameController,
                          cursorColor: Colors.grey,
                          decoration: _inputDecoration(
                            hint: 'Enter your last name',
                            errorText: _lastNameError,
                          ),
                          onChanged: (value) {
                            if (_lastNameError != null) {
                              setState(() {
                                _lastNameError = null;
                              });
                            }
                          },
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
                        if (_genderError != null) ...[
                          8.vSpace,
                          Text(
                            _genderError!,
                            style: AppTextStyles.titleSmall.copyWith(
                              color: AppColors.error,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                        20.vSpace,

                        _labelWithAsterisk("Date of Birth"),
                        8.vSpace,
                        TextField(
                          cursorColor: Colors.grey,
                          readOnly: true,
                          controller: TextEditingController(
                            text: _selectedDate != null
                                ? DateFormat(
                                    'dd/MM/yyyy',
                                  ).format(_selectedDate!)
                                : '',
                          ),
                          decoration: _inputDecoration(
                            hint: 'Select your date of birth',
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 20.rw,
                            ),
                            errorText: _dateOfBirthError,
                          ),
                          onTap: _pickDateOfBirth,
                        ),
                        20.vSpace,
                        CustomButton(
                          text: "Let's Begin",
                          onPressed: _handleNext,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Fixed bottom button container
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

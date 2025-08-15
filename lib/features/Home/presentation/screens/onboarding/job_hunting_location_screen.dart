import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/chips.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_assignment3/core/services/local_storage_service.dart';

class JobHuntingScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onNext;

  const JobHuntingScreen({
    super.key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
    this.onNext,
  });

  @override
  State<JobHuntingScreen> createState() => _JobHuntingScreenState();
}

class _JobHuntingScreenState extends State<JobHuntingScreen> {
  final List<String> _selectedCities = [];
  String? _validationError;

  // Pincode related variables
  final TextEditingController _pincodeController = TextEditingController();
  Map<String, dynamic>? _pincodeData;
  bool _isLoadingPincode = false;
  String? _pincodeError;
  bool _isPincodeValid = false;

  @override
  void dispose() {
    _pincodeController.dispose();
    super.dispose();
  }

  // Pincode validation and API call
  Future<void> _fetchPincodeData(String pincode) async {
    if (pincode.length != 6) {
      setState(() {
        _pincodeError = 'Pincode must be 6 digits';
        _pincodeData = null;
        _isPincodeValid = false;
      });
      return;
    }

    // Check if pincode contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(pincode)) {
      setState(() {
        _pincodeError = 'Pincode must contain only numbers';
        _pincodeData = null;
        _isPincodeValid = false;
      });
      return;
    }

    setState(() {
      _isLoadingPincode = true;
      _pincodeError = null;
      _pincodeData = null;
    });

    try {
      final response = await http.get(
        Uri.parse('https://api.postalpincode.in/pincode/$pincode'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        if (data.isNotEmpty && data[0]['Status'] == 'Success') {
          final postOffice = data[0]['PostOffice'][0];
          setState(() {
            _pincodeData = postOffice;
            _isPincodeValid = true;
            _pincodeError = null;
          });

          // Automatically add the town to selected cities if not already present
          final townName = postOffice['Name'];
          if (townName != null && !_selectedCities.contains(townName)) {
            _selectedCities.add(townName);
          }
        } else {
          setState(() {
            _pincodeError = 'Invalid pincode';
            _pincodeData = null;
            _isPincodeValid = false;
          });
        }
      } else {
        setState(() {
          _pincodeError = 'Failed to fetch pincode data';
          _pincodeData = null;
          _isPincodeValid = false;
        });
      }
    } catch (e) {
      setState(() {
        _pincodeError = 'Network error: ${e.toString()}';
        _pincodeData = null;
        _isPincodeValid = false;
      });
    } finally {
      setState(() {
        _isLoadingPincode = false;
      });
    }
  }

  void _toggleCity(String city) {
    setState(() {
      if (_selectedCities.contains(city)) {
        _selectedCities.remove(city);
      } else {
        _selectedCities.add(city);
      }
      _validationError = null; // Clear error when cities are selected
    });
  }

  // Form validation
  bool _validateForm() {
    if (_selectedCities.isEmpty) {
      setState(() {
        _validationError =
            'Please select at least one location from the available options';
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
      await localStorage.saveLocation(_selectedCities.join(', '));

      // Pass to next screen
      if (widget.onNext != null) {
        widget.onNext!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: IntroAppBar(
        title: "Where are you job hunting?",
        subtitle: "This helps us find amazing jobs in your preferred location.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            padding: 16.horizontalPadding,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.vSpace, // top spacing
                // Current Location Card
                _locationCard(
                  title: 'Current Location',
                  subtitle: 'Find jobs in your current city',
                  isSelected: true,
                ),

                20.vSpace,

                // Pincode Input Section
                Text(
                  'Enter Pincode',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.gray900,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                8.vSpace,

                TextFormField(
                  controller: _pincodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: 'Enter 6-digit pincode',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14.sp,
                    ),
                    prefixIcon: Container(
                      padding: 12.allPadding,
                      child: Icon(
                        Icons.location_on,
                        color: AppColors.secondary,
                        size: 20.rw,
                      ),
                    ),
                    suffixIcon: _isLoadingPincode
                        ? Container(
                            padding: 12.allPadding,
                            child: SizedBox(
                              width: 20.rw,
                              height: 20.rh,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.rw,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.secondary,
                                ),
                              ),
                            ),
                          )
                        : _pincodeController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.grey.shade500,
                              size: 20.rw,
                            ),
                            onPressed: () {
                              _pincodeController.clear();
                              setState(() {
                                _pincodeData = null;
                                _pincodeError = null;
                                _isPincodeValid = false;
                              });
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: 20.allPadding,
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
                      borderSide: BorderSide(color: AppColors.secondary),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.rw),
                      borderSide: BorderSide(color: AppColors.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.rw),
                      borderSide: BorderSide(color: AppColors.error),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromRGBO(0, 0, 0, 0.867),
                  ),
                  onChanged: (value) {
                    if (value.length == 6) {
                      _fetchPincodeData(value);
                    } else {
                      setState(() {
                        _pincodeData = null;
                        _pincodeError = null;
                        _isPincodeValid = false;
                      });
                    }
                  },
                  onTap: () {
                    // Clear previous pincode data when user starts typing
                    if (_pincodeController.text.isNotEmpty) {
                      setState(() {
                        _pincodeData = null;
                        _pincodeError = null;
                        _isPincodeValid = false;
                      });
                    }
                  },
                ),

                if (_pincodeError != null) ...[
                  8.vSpace,
                  Text(
                    _pincodeError!,
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.error,
                      fontSize: 12.sp,
                    ),
                  ),
                ],

                // Simple Pincode Success Message
                if (_pincodeData != null && _isPincodeValid) ...[
                  8.vSpace,
                  Container(
                    padding: 12.allPadding,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.rw),
                      border: Border.all(
                        color: Colors.green.withOpacity(0.3),
                        width: 1.rw,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16.rw,
                        ),
                        8.hSpace,
                        Text(
                          'Pincode verified successfully!',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                20.vSpace,

                Text(
                  'Select your preferred location(s)',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.gray900,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                8.vSpace,
                Text(
                  'Tap on locations to select/deselect them. You can also add a new location by entering a pincode above.',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.gray600,
                    fontSize: 12.sp,
                  ),
                ),
                12.vSpace,

                // Available Locations Chips
                Wrap(
                  spacing: 10.rw,
                  runSpacing: 10.rh,
                  children: [
                    Chips(
                      label: 'Delhi',
                      isSelected: _selectedCities.contains('Delhi'),
                      verticalPadding: 5.rh,
                      horizontalPadding: 5.rw,
                      onTap: () => _toggleCity('Delhi'),
                    ),
                    Chips(
                      label: 'Bengaluru',
                      isSelected: _selectedCities.contains('Bengaluru'),
                      verticalPadding: 5.rh,
                      horizontalPadding: 5.rw,
                      onTap: () => _toggleCity('Bengaluru'),
                    ),
                    Chips(
                      label: 'Mumbai',
                      isSelected: _selectedCities.contains('Mumbai'),
                      verticalPadding: 5.rh,
                      horizontalPadding: 5.rw,
                      onTap: () => _toggleCity('Mumbai'),
                    ),
                    Chips(
                      label: 'Chennai',
                      isSelected: _selectedCities.contains('Chennai'),
                      verticalPadding: 5.rh,
                      horizontalPadding: 5.rw,
                      onTap: () => _toggleCity('Chennai'),
                    ),
                    Chips(
                      label: 'Hyderabad',
                      isSelected: _selectedCities.contains('Hyderabad'),
                      verticalPadding: 5.rh,
                      horizontalPadding: 5.rw,
                      onTap: () => _toggleCity('Hyderabad'),
                    ),
                    Chips(
                      label: 'Pune',
                      isSelected: _selectedCities.contains('Pune'),
                      verticalPadding: 5.rw,
                      horizontalPadding: 5.rw,
                      onTap: () => _toggleCity('Pune'),
                    ),
                    // Add pincode town as a chip if available
                    if (_pincodeData != null &&
                        _isPincodeValid &&
                        _pincodeData!['Name'] != null)
                      Chips(
                        label: _pincodeData!['Name'],
                        isSelected: _selectedCities.contains(
                          _pincodeData!['Name'],
                        ),
                        verticalPadding: 5.rh,
                        horizontalPadding: 5.rw,
                        onTap: () => _toggleCity(_pincodeData!['Name']),
                      ),
                  ],
                ),

                if (_validationError != null) ...[
                  16.vSpace,
                  Text(
                    _validationError!,
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.error,
                      fontSize: 12.sp,
                    ),
                  ),
                ],

                20.vSpace,
                CustomButton(text: "Continue", onPressed: _handleNext),
                20.vSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _locationCard({
    required String title,
    required String subtitle,
    bool isSelected = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.rh),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.accentBlue.withOpacity(0.5)
            : AppColors.white,
        borderRadius: BorderRadius.circular(16.rw),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.gray400,
          width: 1.5.rw,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.rw,
            offset: Offset(0, 4.rh),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 4.rh),
        leading: Container(
          height: 50.rh,
          width: 50.rw,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.rw),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6.rw,
                offset: Offset(0, 3.rh),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/icons/location.png',
              color: AppColors.secondary,
              height: 24.rh,
              width: 24.rw,
            ),
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.gray800,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.gray600,
            fontSize: 14.sp,
          ),
        ),
        trailing: Icon(
          isSelected
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
          color: AppColors.secondary,
          size: 24.rw,
        ),
      ),
    );
  }
}

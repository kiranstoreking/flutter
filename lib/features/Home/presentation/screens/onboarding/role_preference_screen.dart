import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/chips.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class SkillsScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onNext;

  const SkillsScreen({
    super.key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
    this.onNext,
  });

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final List<String> _selectedSkills = [];
  String? _validationError;
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredSkills = [];
  bool _isSearching = false;

  // Available skills - 30 design-related skills
  final List<String> _availableSkills = [
    'UI/UX Design',
    'Product Design',
    'Graphic Design',
    'Web Design',
    'Mobile App Design',
    'Brand Identity Design',
    'Logo Design',
    'Typography',
    'Color Theory',
    'Layout Design',
    'Icon Design',
    'Illustration',
    'Digital Art',
    'Print Design',
    'Packaging Design',
    'Motion Graphics',
    '3D Design',
    'User Research',
    'Wireframing',
    'Prototyping',
    'Interaction Design',
    'Information Architecture',
    'Visual Design',
    'Design Systems',
    'Responsive Design',
    'Accessibility Design',
    'Design Thinking',
    'User Testing',
    'Design Strategy',
    'Creative Direction',
  ];

  @override
  void initState() {
    super.initState();
    _filteredSkills = _availableSkills.take(6).toList();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredSkills = _availableSkills.take(6).toList();
        _isSearching = false;
      } else {
        _filteredSkills = _availableSkills
            .where((skill) => skill.toLowerCase().contains(query))
            .toList();
        _isSearching = true;
      }
    });
  }

  void _toggleSkill(String skill) {
    setState(() {
      if (_selectedSkills.contains(skill)) {
        _selectedSkills.remove(skill);
      } else {
        _selectedSkills.add(skill);
      }
      _validationError = null; // Clear error when skills are selected
    });
  }

  // Form validation
  bool _validateForm() {
    if (_selectedSkills.length < 3) {
      setState(() {
        _validationError = 'Please select at least 3 skills';
      });
      return false;
    }
    return true;
  }

  // Handle next button press
  void _handleNext() {
    if (_validateForm()) {
      // Save data or pass to next screen
      if (widget.onNext != null) {
        widget.onNext!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "What are you great at?",
        subtitle:
            "Select your top skills so the right companies\ncan find you.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
      ),
      body: Padding(
        padding: 15.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.vSpace,
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search your skills',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14.sp,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.rw),
                  child: Image.asset(
                    AppAssets.search,
                    height: 18.rh,
                    width: 18.rw,
                    fit: BoxFit.contain,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.rw,
                  vertical: 16.rh,
                ),
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
            if (_isSearching) ...[
              Text(
                'Search Results (${_filteredSkills.length} skills found)',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.gray600,
                  fontSize: 12.sp,
                ),
              ),
              8.vSpace,
            ] else ...[
              Text(
                'Popular Skills (showing 6 of ${_availableSkills.length})',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.gray600,
                  fontSize: 12.sp,
                ),
              ),
              8.vSpace,
            ],
            Wrap(
              spacing: 8.rw,
              runSpacing: 8.rh,
              children: _filteredSkills
                  .map(
                    (skill) => Chips(
                      label: skill,
                      isSelected: _selectedSkills.contains(skill),
                      onTap: () => _toggleSkill(skill),
                    ),
                  )
                  .toList(),
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
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 20.rh),
              child: CustomButton(
                text: "Find My Matches",
                onPressed: _handleNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

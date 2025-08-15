import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_assignment3/core/services/local_storage_service.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  LocalStorageService? _localStorage;
  Map<String, dynamic> _userData = {};
  bool _isAboutMeExpanded = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    _localStorage = await LocalStorageService.getInstance();
    setState(() {
      _userData = _localStorage!.getAllUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        leadingWidth: 150.rw, // adjust width to fit arrow + text
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 18.rw), // left padding
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(30.rw),
              child: Image.asset(
                AppAssets.leftArrowIcon,
                height: 18.rh,
                width: 18.rw,
                color: AppColors.primaryLight,
              ),
            ),
            15.hSpace, // space between arrow and text
            Flexible(
              child: Text(
                'Edit Profile',
                style: AppTextStyles.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: 16.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: 16.allPadding,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryLight, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12.rw),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8.rh,
                    offset: Offset(0, 4.rh),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.rw),
                    child: Image.asset(
                      AppAssets.profileImage,
                      height: 60.rh,
                      width: 60.rw,
                      fit: BoxFit.cover,
                    ),
                  ),
                  16.hSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_userData['firstName'] ?? 'User'} ${_userData['lastName'] ?? ''}'
                              .trim(),
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        4.vSpace,
                        Text(
                          _userData['rolePreference'] ?? 'Professional',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30.rw),
                    onTap: () {},
                    child: Padding(
                      padding: 6.allPadding,
                      child: Image.asset(
                        AppAssets.pencilIcon,
                        height: 22.rh,
                        width: 22.rw,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.vSpace,
            Text('Update your profile', style: AppTextStyles.bodyMedium),
            16.vSpace,

            // Profile Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 15.rh),
                children: [
                  // About me with accordion functionality
                  AccordionProfileItem(
                    title: 'About me',
                    subtitle:
                        _userData['aboutMe'] ??
                        'Introduce yourselves in a few lines',
                    imagePaths: AppAssets.userRoundIcon,
                    hasData: _userData['aboutMe'] != null,
                    isExpanded: _isAboutMeExpanded,
                    onToggle: () {
                      setState(() {
                        _isAboutMeExpanded = !_isAboutMeExpanded;
                      });
                    },
                    userData: _userData,
                  ),
                  ProfileItem(
                    title: 'Skills',
                    subtitle:
                        _userData['skills'] != null &&
                            (_userData['skills'] as List).isNotEmpty
                        ? '${(_userData['skills'] as List).length} skills added'
                        : 'Highlight your top abilities',
                    imagePaths: AppAssets.skillsIocns,
                    hasData:
                        _userData['skills'] != null &&
                        (_userData['skills'] as List).isNotEmpty,
                  ),
                  ProfileItem(
                    title: 'Experience',
                    subtitle:
                        _userData['experience'] ?? 'Add your work journey',
                    imagePaths: AppAssets.briefcaseIcon,
                    hasData: _userData['experience'] != null,
                  ),
                  ProfileItem(
                    title: 'Education',
                    subtitle:
                        _userData['education'] ??
                        'List your degrees and institutions',
                    imagePaths: AppAssets.graduationCapIcon,
                    hasData: _userData['education'] != null,
                  ),
                  ProfileItem(
                    title: 'Projects',
                    subtitle:
                        _userData['projects'] ?? 'Showcase your best work',
                    imagePaths: AppAssets.projects,
                    hasData: _userData['projects'] != null,
                  ),
                  ProfileItem(
                    title: 'Awards & Certifications',
                    subtitle:
                        _userData['awards'] ?? 'Mention honors or recognitions',
                    imagePaths: AppAssets.awardsAndCertification,
                    hasData: _userData['awards'] != null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePaths;
  final bool hasData;

  const ProfileItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePaths,
    this.hasData = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.rh),
      padding: EdgeInsets.symmetric(vertical: 12.rh, horizontal: 14.rw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.rw),
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6.rh,
            offset: Offset(0, 3.rh),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 42.rh,
            width: 42.rw,
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8.rw),
            ),
            padding: EdgeInsets.all(8.rw),
            child: Image.asset(imagePaths, fit: BoxFit.contain),
          ),
          14.hSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                3.vSpace,
                Text(
                  subtitle,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          hasData
              ? Icon(Icons.edit, color: AppColors.secondary, size: 18.rw)
              : Image.asset(AppAssets.plusIcon, height: 18.rh, width: 18.rw),
        ],
      ),
    );
  }
}

class AccordionProfileItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePaths;
  final bool hasData;
  final bool isExpanded;
  final VoidCallback onToggle;
  final Map<String, dynamic> userData;

  const AccordionProfileItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePaths,
    this.hasData = false,
    required this.isExpanded,
    required this.onToggle,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.rh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.rw),
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6.rh,
            offset: Offset(0, 3.rh),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header section
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(12.rw),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.rh, horizontal: 14.rw),
              child: Row(
                children: [
                  Container(
                    height: 42.rh,
                    width: 42.rw,
                    decoration: BoxDecoration(
                      color: AppColors.info.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8.rw),
                    ),
                    padding: EdgeInsets.all(8.rw),
                    child: Image.asset(imagePaths, fit: BoxFit.contain),
                  ),
                  14.hSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyles.bodyLarge),
                        3.vSpace,
                        Text(
                          subtitle,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (hasData)
                        Icon(
                          Icons.edit,
                          color: AppColors.secondary,
                          size: 18.rw,
                        ),
                      if (hasData) SizedBox(width: 8.rw),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.secondary,
                        size: 24.rw,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Accordion content
          if (isExpanded)
            Container(
              padding: EdgeInsets.fromLTRB(14.rw, 0, 14.rw, 16.rh),
              child: Column(
                children: [
                  Divider(color: Colors.grey.shade300, height: 1),
                  16.vSpace,

                  // Personal Information Section
                  _buildInfoSection('Personal Information', [
                    {
                      'label': 'First Name',
                      'value': userData['firstName'] ?? 'Not provided',
                    },
                    {
                      'label': 'Last Name',
                      'value': userData['lastName'] ?? 'Not provided',
                    },
                    {
                      'label': 'Gender',
                      'value': userData['gender'] ?? 'Not provided',
                    },
                    {
                      'label': 'Date of Birth',
                      'value': userData['dateOfBirth'] ?? 'Not provided',
                    },
                    {
                      'label': 'Email',
                      'value': userData['email'] ?? 'Not provided',
                    },
                    {
                      'label': 'Phone',
                      'value': userData['phone'] ?? 'Not provided',
                    },
                    {
                      'label': 'Location',
                      'value': userData['location'] ?? 'Not provided',
                    },
                  ]),

                  16.vSpace,

                  // Educational Background Section
                  _buildInfoSection('Educational Background', [
                    {
                      'label': 'Qualification',
                      'value': userData['qualification'] ?? 'Not provided',
                    },
                    {
                      'label': 'Role Preference',
                      'value': userData['rolePreference'] ?? 'Not provided',
                    },
                  ]),

                  16.vSpace,

                  // Professional Information Section
                  _buildInfoSection('Professional Information', [
                    {
                      'label': 'Skills',
                      'value':
                          userData['skills'] != null &&
                              (userData['skills'] as List).isNotEmpty
                          ? (userData['skills'] as List).join(', ')
                          : 'Not provided',
                    },
                    {
                      'label': 'Experience',
                      'value': userData['experience'] ?? 'Not provided',
                    },
                    {
                      'label': 'Education',
                      'value': userData['education'] ?? 'Not provided',
                    },
                    {
                      'label': 'Projects',
                      'value': userData['projects'] ?? 'Not provided',
                    },
                    {
                      'label': 'Awards & Certifications',
                      'value': userData['awards'] ?? 'Not provided',
                    },
                  ]),

                  16.vSpace,

                  // About Me Section
                  if (userData['aboutMe'] != null &&
                      userData['aboutMe'].toString().isNotEmpty)
                    _buildInfoSection('About Me', [
                      {'label': 'Description', 'value': userData['aboutMe']},
                    ]),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(
    String sectionTitle,
    List<Map<String, String>> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        12.vSpace,
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.rw),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: items.map((item) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.rw,
                  vertical: 12.rh,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade100, width: 0.5),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.rw,
                      child: Text(
                        item['label']!,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item['value']!,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

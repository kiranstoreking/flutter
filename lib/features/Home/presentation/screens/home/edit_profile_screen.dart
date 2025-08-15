import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatelessWidget {
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
                          'Shubham Jaiswal',
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        4.vSpace,
                        Text(
                          'CNC Programmer',
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
                  ProfileItem(
                    title: 'About me',
                    subtitle: 'Introduce yourselves in a few lines',
                    imagePaths: AppAssets.userRoundIcon,
                  ),
                  ProfileItem(
                    title: 'Skills',
                    subtitle: 'Highlight your top abilities',
                    imagePaths: AppAssets.skillsIocns,
                  ),
                  ProfileItem(
                    title: 'Experience',
                    subtitle: 'Add your work journey',
                    imagePaths: AppAssets.briefcaseIcon,
                  ),
                  ProfileItem(
                    title: 'Education',
                    subtitle: 'List your degrees and institutions',
                    imagePaths: AppAssets.graduationCapIcon,
                  ),
                  ProfileItem(
                    title: 'Projects',
                    subtitle: 'Showcase your best work',
                    imagePaths: AppAssets.projects,
                  ),
                  ProfileItem(
                    title: 'Awards & Certifications',
                    subtitle: 'Mention honors or recognitions',
                    imagePaths: AppAssets.awardsAndCertification,
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

  const ProfileItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePaths,
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
          Image.asset(AppAssets.plusIcon, height: 18.rh, width: 18.rw),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/edit_profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.rw),
          children: [
            _buildUserInfo(),
            20.vSpace,
            _sectionWrapper(_buildSkillsSection()),
            20.vSpace,
            _sectionWrapper(_buildResumeSection()),
            20.vSpace,
            _sectionTitle("My Activity"),
            _sectionWrapper(_buildActivitySection()),
            20.vSpace,
            _sectionTitle("General"),
            _sectionWrapper(_buildGeneralSection(context)),
            20.vSpace,
            CustomButton(onPressed: () {}, text: "Logout"),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.rw, vertical: 4.rh),
      child: Text(
        title,
        style: AppTextStyles.bodyLarge.copyWith(fontSize: 16.sp),
      ),
    );
  }

  Widget _sectionWrapper(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.rw),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8.rw,
            offset: Offset(0, 4.rh),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }

  Widget _buildUserInfo() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff001EE6),
            Color(0xff031BBB),
            Color(0xff0117AF),
            Color(0xff00138F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.rw),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.rw,
            offset: Offset(0, 5.rh),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.rw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shubham Jaiswal',
                style: AppTextStyles.labelMedium.copyWith(fontSize: 18.sp),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.rw),
            ],
          ),
          6.vSpace,
          Text(
            'CNC Programmer • Bengaluru • 2yr Exp',
            style: AppTextStyles.labelSmall.copyWith(fontSize: 14.sp),
          ),
          15.vSpace,
          Text(
            '+919434789344',
            style: AppTextStyles.labelSmall.copyWith(fontSize: 14.sp),
          ),
          6.vSpace,
          Text(
            'shubham1004@gmail.com',
            style: AppTextStyles.labelSmall.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Padding(
      padding: EdgeInsets.all(16.rw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _iconBox(AppAssets.skillsIocns),
                  10.hSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'My Skill ',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Collection',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14.rw,
                color: AppColors.primary,
              ),
            ],
          ),
          8.vSpace,
          Wrap(
            spacing: 8.rw,
            runSpacing: 8.rh,
            children: [
              _skillChip('UI/UX Design'),
              _skillChip('Fullstack Developer'),
              _skillChip('Marketing'),
              _skillChip('Illustration'),
              _skillChip('Product Design'),
              _skillChip('+ 10 more'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label, style: TextStyle(fontSize: 12.sp)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.rw)),
      backgroundColor: Colors.blue.shade100,
    );
  }

  Widget _iconBox(String assetPath) {
    return Container(
      height: 44.rw,
      width: 44.rw,
      decoration: BoxDecoration(
        color: AppColors.info.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.rw),
      ),
      padding: EdgeInsets.all(8.rw),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }

  Widget _buildResumeSection() {
    return Padding(
      padding: EdgeInsets.all(16.rw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ATS Compliant Resume',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              4.vSpace,
              Text(
                'Our AI will help you create one ✚',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          _iconBox(AppAssets.resumeIcon),
        ],
      ),
    );
  }

  Widget _buildActivitySection() {
    final activities = [
      ['Active Applications', AppAssets.jobIcon],
      ['Job Preferences', AppAssets.preferencesIcon],
      ['Enrolled Courses', AppAssets.graduationCapIcon],
      ['Attended Webinars', AppAssets.webinarsIcon],
    ];

    return Column(
      children: activities.map((e) => _tileItem(e[0], e[1])).toList(),
    );
  }

  Widget _buildGeneralSection(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    EditProfileScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
          child: _tileItem('Account settings', AppAssets.userRoundCogIcon),
        ),
        InkWell(
          onTap: () {},
          child: _tileItem('Help & Feedback', AppAssets.infoIcon),
        ),
      ],
    );
  }

  Widget _tileItem(String title, String iconPath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 12.rh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _iconBox(iconPath),
              12.hSpace,
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 14.rw, color: AppColors.primary),
        ],
      ),
    );
  }
}

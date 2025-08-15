import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/constants/app_sizes.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';

class IntroAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onBack;

  const IntroAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.totalPages,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Decorative background app icon
            Positioned(
              right: (0).rw,
              bottom: (0).rh,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  AppAssets.appicon,
                  height: 180.rh,
                  width: 180.rw,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Back button
            if (currentPage != 0)
              Positioned(
                top: topPadding + 12.rh,
                left: 16.rw,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.rw),
                  elevation: 4,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.rw),
                    onTap: onBack ?? () => Navigator.pop(context),
                    child: Padding(
                      padding: EdgeInsets.all(10.rw),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 22.rw,
                      ),
                    ),
                  ),
                ),
              ),

            // Title & Subtitle
            Positioned(
              left: 20.rw,
              right: 20.rw,
              bottom: 36.rh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.displaySmall.copyWith(
                      color: Colors.white,
                      fontSize: 24.sp,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 10.rh),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white70,
                      fontSize: 14.sp,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(12.rh),
        child: Stack(
          children: [
            // Background track
            Container(height: 9.rh, color: AppColors.gray400),
            // Progress indicator
            LayoutBuilder(
              builder: (context, constraints) {
                double progressWidth =
                    constraints.maxWidth * ((currentPage + 1) / totalPages);
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 9.rh,
                    width: progressWidth,
                    decoration: BoxDecoration(
                      color: AppColors.info,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8.rw),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(220.rh);
}

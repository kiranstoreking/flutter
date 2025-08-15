import 'package:flutter/material.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/job_hunting_location_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/personal_info_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/qualification_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/ready_to_go_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/role_preference_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _goBack() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  List<Widget> get slides => [
    UserInfoScreen(currentPage: 0, totalPages: 5, onBack: _goBack),
    EducationalBackgroundScreen(currentPage: 1, totalPages: 5, onBack: _goBack),
    JobHuntingScreen(currentPage: 2, totalPages: 5, onBack: _goBack),
    SkillsScreen(currentPage: 3, totalPages: 5, onBack: _goBack),
    WelcomeScreen(
      userName: "LLdsld",
      currentPage: 4,
      totalPages: 5,
      onBack: _goBack,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: slides.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    // right: 16,
                    bottom: 4,
                  ), // horizontal + bottom gap only
                  child: slides[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

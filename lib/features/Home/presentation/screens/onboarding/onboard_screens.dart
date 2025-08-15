import 'package:flutter/material.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/job_hunting_location_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/personal_info_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/qualification_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/ready_to_go_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/role_preference_screen.dart';
import 'package:flutter_assignment3/core/services/local_storage_service.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  String _userFullName = "User"; // Default value
  int _welcomeScreenKey = 0; // Key to force rebuild WelcomeScreen

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadUserFullName();
  }

  Future<void> _loadUserFullName() async {
    final localStorage = await LocalStorageService.getInstance();
    final firstName = localStorage.getFirstName() ?? "";
    final lastName = localStorage.getLastName() ?? "";

    print("Loading user name - First: '$firstName', Last: '$lastName'");

    if (firstName.isNotEmpty || lastName.isNotEmpty) {
      final fullName = "${firstName.trim()} ${lastName.trim()}".trim();
      print("Setting full name to: '$fullName'");
      setState(() {
        _userFullName = fullName;
        _welcomeScreenKey++; // Force rebuild of WelcomeScreen
      });
    } else {
      print("No name found, keeping default: '$_userFullName'");
    }
  }

  void _goBack() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentPage < _buildSlides().length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Refresh user name when navigating to the last screen
  void _onPageChanged(int index) {
    setState(() => _currentPage = index);

    // If we're going to the last screen (WelcomeScreen), refresh the user name
    if (index == 4) {
      print("Navigating to WelcomeScreen, refreshing user name...");
      // Debug local storage first
      debugLocalStorage();
      // Add a small delay to ensure local storage is updated
      Future.delayed(const Duration(milliseconds: 100), () {
        _loadUserFullName();
      });
    }
  }

  // Force refresh user name - can be called from WelcomeScreen
  Future<void> forceRefreshUserName() async {
    print("forceRefreshUserName called");
    await _loadUserFullName();
  }

  // Method to refresh user name from any screen
  Future<void> refreshUserName() async {
    print("refreshUserName called");
    await _loadUserFullName();
  }

  // Debug method to check local storage
  Future<void> debugLocalStorage() async {
    final localStorage = await LocalStorageService.getInstance();
    final firstName = localStorage.getFirstName();
    final lastName = localStorage.getLastName();
    print("DEBUG - Local Storage - First: '$firstName', Last: '$lastName'");
    print("DEBUG - Current _userFullName: '$_userFullName'");

    // Also check if we can write and read back
    if (firstName != null && firstName.isNotEmpty) {
      print("DEBUG - Testing write/read for firstName: '$firstName'");
      await localStorage.saveFirstName("TEST_$firstName");
      final testRead = localStorage.getFirstName();
      print("DEBUG - Test read result: '$testRead'");
      // Restore original
      await localStorage.saveFirstName(firstName);
    }
  }

  // Test method to set a hardcoded name
  void setTestName() {
    setState(() {
      _userFullName = "Test User Name";
      _welcomeScreenKey++;
    });
    print("DEBUG - Set test name to: '$_userFullName'");
  }

  List<Widget> _buildSlides() {
    return [
      UserInfoScreen(
        currentPage: 0,
        totalPages: 5,
        onBack: _goBack,
        onNext: _goToNext,
        onNameSaved: refreshUserName,
      ),
      EducationalBackgroundScreen(
        currentPage: 1,
        totalPages: 5,
        onBack: _goBack,
        onNext: _goToNext,
      ),
      JobHuntingScreen(
        currentPage: 2,
        totalPages: 5,
        onBack: _goBack,
        onNext: _goToNext,
      ),
      SkillsScreen(
        currentPage: 3,
        totalPages: 5,
        onBack: _goBack,
        onNext: _goToNext,
      ),
      WelcomeScreen(
        key: ValueKey(_welcomeScreenKey),
        userName: _userFullName,
        currentPage: 4,
        totalPages: 5,
        onBack: _goBack,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _buildSlides().length,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable horizontal scrolling
              onPageChanged: (index) {
                _onPageChanged(index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    // right: 16,
                    bottom: 4,
                  ), // horizontal + bottom gap only
                  child: _buildSlides()[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

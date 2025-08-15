import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/theme/app_theme.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/edit_profile_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/profile_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/onboard_screens.dart';
import 'package:sizer/sizer.dart'; // <-- Import Sizer

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Job Search App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: IntroScreen(),
        );
      },
    );
  }
}

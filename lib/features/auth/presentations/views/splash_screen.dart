import 'package:flutter/material.dart';
import 'package:rise/core/theme/app_colors.dart';
import 'package:rise/features/auth/presentations/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text('Rise', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void navigate() {
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }
}

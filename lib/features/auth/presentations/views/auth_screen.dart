import 'package:flutter/material.dart';
import 'package:rise/core/config/constants.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';
import 'package:rise/features/main_activity.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Text("$appName above anything".cap, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            30.height(),
            Image.asset("assets/onboarding_two.png", height: 200),
            Spacer(),

            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.primaryColor)),
              icon: Icon(Icons.g_mobiledata, color: AppColors.red),
              label: Text("Rise with Google", style: TextStyle(color: AppColors.white)),
              onPressed: () {},
            ),
            20.height(),
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.primaryColor)),

              icon: Icon(Icons.apple, color: AppColors.black),
              label: Text(" Rise with Apple ", style: TextStyle(color: AppColors.white)),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

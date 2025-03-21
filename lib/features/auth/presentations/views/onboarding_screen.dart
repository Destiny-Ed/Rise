import 'package:flutter/material.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';
import 'package:rise/features/auth/presentations/views/auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/onboarding_one.png',
      'title': 'Build Better Habits',
      'desc': 'Track and improve your daily habits effortlessly.',
    },
    {
      'image': 'assets/onboarding_two.png',
      'title': 'Stay Consistent',
      'desc': 'Earn streaks and keep yourself accountable.',
    },
    {
      'image': 'assets/onboarding_three.png',
      'title': 'Join the Community',
      'desc': 'Support friends and stay motivated together.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset(onboardingData[index]['image']!)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onboardingData[index]['title']!,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        10.height(),
                        Text(
                          onboardingData[index]['desc']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        50.height(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => Container(
                    margin: EdgeInsets.all(4),
                    width: _currentIndex == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? AppColors.primaryColor : AppColors.darkGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    if (_currentIndex == onboardingData.length - 1) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AuthScreen()));
                    } else {
                      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      _currentIndex != onboardingData.length - 1 ? Icons.arrow_forward : Icons.check,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

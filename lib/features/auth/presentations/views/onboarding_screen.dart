import 'package:flutter/material.dart';
import 'package:rise/features/auth/presentations/views/auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/onboarding1.png',
      'title': 'Build Better Habits',
      'desc': 'Track and improve your daily habits effortlessly.',
    },
    {
      'image': 'assets/onboarding2.png',
      'title': 'Stay Consistent',
      'desc': 'Earn streaks and keep yourself accountable.',
    },
    {
      'image': 'assets/onboarding3.png',
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
                    Image.asset(onboardingData[index]['image']!),
                    SizedBox(height: 20),
                    Text(onboardingData[index]['title']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(onboardingData[index]['desc']!, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: EdgeInsets.all(4),
                width: _currentIndex == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          _currentIndex == onboardingData.length - 1
              ? ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AuthScreen()));
                },
                child: Text('Get Started'),
              )
              : TextButton(
                onPressed: () => _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn),
                child: Text('Next'),
              ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

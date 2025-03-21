import 'package:flutter/material.dart';
import 'package:rise/core/config/extensions.dart';

class EmtpyWidget extends StatelessWidget {
  final String title;
  const EmtpyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', //TODO: replace with the proper icon
              width: MediaQuery.of(context).size.width / 2,
            ),
            20.height(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title.cap,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

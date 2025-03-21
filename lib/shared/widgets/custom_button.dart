import 'package:flutter/material.dart';
import 'package:rise/core/config/extensions.dart';
import 'package:rise/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color bgColor;
  final Color? textColor;
  final bool showBorder;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double width;
  // final double height;
  const CustomButton({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.showBorder = false,
    this.textColor,
    this.padding,
    required this.bgColor,
    this.onTap,
    this.width = 248,
    // this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(10),
        width: width,
        // height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
          border: showBorder ? Border.all(color: Theme.of(context).iconTheme.color!, width: 0.5) : null,
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text.cap,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.text, required this.icon, this.onTap});

  final String text;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: screenSize(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.darkGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20, height: 20, child: Image.asset(icon, fit: BoxFit.cover)),
            30.width(),
            Text(text.cap, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

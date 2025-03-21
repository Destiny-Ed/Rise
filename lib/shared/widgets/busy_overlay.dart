import 'package:flutter/material.dart';
import 'package:rise/core/theme/app_colors.dart';

class BusyOverlay extends StatelessWidget {
  final Widget? child;
  final String title;
  final bool show;
  final double? height;
  final double opacity;

  const BusyOverlay({
    super.key,
    this.child,
    this.title = 'Please wait...',
    this.show = false,
    this.height,
    this.opacity = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bgColor,
      child: Stack(
        children: <Widget>[
          child!,
          IgnorePointer(
            ignoring: !show,
            child: Opacity(
              opacity: show ? 1.0 : 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: height ?? MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                // color: whiteColor.withOpacity(opacity),
                color: Colors.transparent,
                //color: const Color.fromARGB(100, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                        backgroundColor: AppColors.secondaryColor,
                      ),
                    ),
                    // const Image(
                    //   image: AssetImage("assets/logo.png"),
                    //   width: 50,
                    // ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: TextStyle(color: AppColors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(
                    //   height: height.toDouble(),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:design/constants/appcolors.dart';
import 'package:design/design/home/home.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        animationDuration: const Duration(milliseconds: 2000),
        duration: 3000,
        splash: Image.asset(
          "assets/images/logo.png",
          height: 350,
          width: 350,
        ),
        nextScreen: const Home(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: AppColors.kbgcolor);
  }
}

import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class Postlogin extends StatelessWidget {
  const Postlogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/postlogin.png',
        splashIconSize: double.maxFinite,
        duration: 5000,
        backgroundColor: Colors.white,
        nextScreen: logIn(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
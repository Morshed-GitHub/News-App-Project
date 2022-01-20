import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: const Color.fromRGBO(50, 75, 205, 1),
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/News_Icon_removeBG.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            const Text(
              "News App",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
        duration: 2000,
        splashIconSize: 500,
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: const HomePage());
  }
}

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:football_app/screens/homepage.dart';
import 'package:lottie/lottie.dart';

class SScreen extends StatelessWidget {
  const SScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Center(


          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lot.json', height: 100, ),
             
              SizedBox(height: 20),
              Text(
                'Launching Your App', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      nextScreen: HomePage(),
      splashIconSize: 200,
      duration: 2800,
      backgroundColor: Colors.blueGrey,
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}

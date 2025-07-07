import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/utils/app_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.blueColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: Column(
          children: [
            Spacer(),
            startButton('Create an account',
                () => context.pushNamed(AppRouterConstants.signUpPage)),
            SizedBox(height: 25),
            startButton('Login with existing account',
                () => context.pushNamed(AppRouterConstants.signInPage)),
          ],
        ),
      ),
    );
  }

  Widget startButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsConstants.blueColor,
        textStyle: TextstyleConstants.buttonTextStyle,
        backgroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

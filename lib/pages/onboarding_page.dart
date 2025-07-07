import 'package:flutter/material.dart';
import 'package:trippify/constants/colors_constants.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void onContinueButtonPressed() {
    if (_currentIndex < 2) {
      setState(() {
        _currentIndex++;
      });
    } else {}
  }

  final List<String> onboardingTitles = [
    "Explore the World",
    "Plan Your Trips",
    "Share Your Adventures",
  ];

  final List<String> onboardingSubtitles = [
    "Discover new destinations and cultures with ease. Explore more, experience more, and make every journey unforgettable.",
    "Organize your travel plans effortlessly. Plan smarter, pack better, and enjoy a seamless travel experience.",
    "Connect with fellow travelers and share your experiences. Inspire others, build friendships, and create lasting memories together.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsConstants.blueColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: UShapeClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            onboardingTitles[_currentIndex],
                            style: TextstyleConstants.titleTextStyle3,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            onboardingSubtitles[_currentIndex],
                            style: TextstyleConstants.mediumTextStyle2,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingTitles.length,
                              (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: _currentIndex == index ? 12 : 8,
                                height: _currentIndex == index ? 12 : 8,
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? ColorsConstants.blueColor
                                      : ColorsConstants.blueColor
                                          .withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          CustomGradientButton(
                              label: "Continue", onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }
}

class UShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveHeight = 40;

    final path = Path();
    path.lineTo(0, curveHeight);
    path.quadraticBezierTo(
        size.width / 2, -curveHeight, size.width, curveHeight);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

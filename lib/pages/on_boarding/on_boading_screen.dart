import 'package:first_project/pages/login/login_screen.dart';
import 'package:flutter/material.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: PageView(
            controller: pageController,
            onPageChanged: (value) {
              pageController.animateToPage(
                value,
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
              );
            },
            children: [
              _pageWidget(Colors.deepOrange, context),
              _pageWidget(Colors.amber, context),
              _pageWidget(Colors.deepPurple, context),
            ],
          ),
      
    );
  }

  Widget _pageWidget(Color color, BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text("Go To Home"),
            ),
          )
        ],
      ),
    );
  }
}

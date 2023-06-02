import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          if (value >=2) {
            print("page index $value");
          } else {
            print(value.toString());
          }
        },
        children:  const [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1")
            ],
          ),
          Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("2")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("3")
            ],
          ),
        ],
      )
      
    );
  }
}
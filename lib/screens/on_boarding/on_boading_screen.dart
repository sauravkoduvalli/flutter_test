import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/login/login_screen.dart';
import 'bloc/on_boarding_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          return PageView(
            controller: pageController,
            onPageChanged: (value) {
              // state.page = value;
              context.read<OnBoardingBloc>().add(OnBoardingEvent(value));
              pageController.animateToPage(
                value,
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
              );
            },
            children: [
              _pageWidget(state, Colors.deepOrange, context),
              _pageWidget(state, Colors.amber, context),
              _pageWidget(state, Colors.deepPurple, context),
            ],
          );
        },
      ),
    );
  }

  Widget _pageWidget(OnBoardingState state, Color color, BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.page.toString()),
          Visibility(
            visible: state.page > 1,
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

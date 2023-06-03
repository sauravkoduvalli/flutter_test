import 'package:first_project/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/on_boarding/on_boarding_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return Scaffold(
      body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          return PageView(
            controller: _pageController,
            onPageChanged: (value) {
              context.read<OnBoardingBloc>().add(OnBoardingEvent(value));
              _pageController.animateToPage(
                value,
                duration: const Duration(seconds: 1),
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
            visible: state.page == 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              child: Text("Go To Home"),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData().copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.deepPurple,
            secondary: Colors.red
          ),
      useMaterial3: true,
    );
  }
}

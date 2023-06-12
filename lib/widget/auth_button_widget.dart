import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function()? onTap;

  const AuthButtonWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                fixedSize: Size(double.infinity, 40.h)),
            child: Text(label),
          ),
        ),
      ],
    );
  }
}
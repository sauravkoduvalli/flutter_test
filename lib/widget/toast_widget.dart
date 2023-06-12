import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastWidget({
  required String message,
  ToastGravity? toastPosition = ToastGravity.BOTTOM,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
  double fontSize = 12.0,
}) {
  return Fluttertoast.showToast(
    msg: message,
    gravity: toastPosition,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: fontSize,
  );
}

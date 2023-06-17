import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/widget/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc.dart';

class RegisterController {
  RegisterController({required this.context});

  final BuildContext context;

  FutureOr<void> handleRegister(String type) async {
    if (type == "email") {
      final state = context.read<RegisterBloc>().state;
      var fullname = state.fullname;
      var email = state.email;
      var password = state.password;
      var confirmPassword = state.confirmPassword;

      if (fullname.isEmpty) {
        toastWidget(message: "Username Required");
      } else if (email.isEmpty) {
        toastWidget(message: "Email Required");
      } else if (password.isEmpty) {
        toastWidget(message: "Password Required");
      } else if (confirmPassword.isEmpty) {
        toastWidget(message: "Confirm Password Required");
      }

      try {
        final credentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (credentials.user != null) {
          await credentials.user?.sendEmailVerification();
          await credentials.user?.updateDisplayName(fullname);
          toastWidget(
              message:
                  "Verification email has been sent. Login after successful verification");
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          toastWidget(message: 'Email is already in use. Try another');
        } else if (e.code == 'invalid-email') {
          toastWidget(message: 'Invalid email address');
        } else if (e.code == 'operation-not-allowed') {
          // toastWidget(message: 'Email is already in use. Try another');
        } else if (e.code == 'weak-password') {
          toastWidget(message: 'Password is weak');
        }
      }
    }
  }
}

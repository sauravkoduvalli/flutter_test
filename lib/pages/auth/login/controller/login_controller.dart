import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/toast_widget.dart';
import '../bloc/login_bloc.dart';

class LoginController {
  const LoginController({required this.context});

  final BuildContext context;

  void handleLogin(String type) async {
    if (type == 'email') {
      final state = context.read<LoginBloc>().state;
      String emailAddress = state.email;
      String password = state.password;

      if (emailAddress.isEmpty) {
        /// email empty validation
        toastWidget(message: "Email is required");
        return;
      }
      if (password.isEmpty) {
        /// password empty validation
        toastWidget(message: "Password is required");
        return;
      }
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

        if (credential.user == null) {
          ///
          toastWidget(message: "User doesn't exist");
          return;
        }
        if (!credential.user!.emailVerified) {
          ///
          toastWidget(message: "Email is not verified for this account");
          return;
        }

        var user = credential.user;

        if (user != null) {
          /// got verified user from firebase
          toastWidget(message: "Login successful");
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
          return;
        } else {
          /// didn't get any user from firebase
          toastWidget(message: "User does not exist. Register now");
          return;
        }
      } on FirebaseAuthException catch (error) {
        if (error.code == "user-not-found") {
          ///
          toastWidget(message: "User not found");
          return;
        } else if (error.code == "invalid-email") {
          ///
          toastWidget(message: "Invalid email address");
          return;
        } else if (error.code == "wrong-password") {
          ///
          toastWidget(message: "Wrong password");
          return;
        }
      }
    }
  }
}

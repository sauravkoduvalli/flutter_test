import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginController {
  const LoginController({required this.context});

  final BuildContext context;

  void handleLogin(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<LoginBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          /// email empty validation
        }
        if (password.isEmpty) {
          /// password empty validation
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            ///
          }
          if (!credential.user!.emailVerified) {
            ///
          }

          var user =  credential.user;

          if (user != null) {
            /// got verified user from firebase
          }else {
            /// didn't get any user from firebase
          }
        } catch (e) {}
      }
    } catch (error) {}
  }
}

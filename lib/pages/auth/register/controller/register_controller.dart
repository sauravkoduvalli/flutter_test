import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc.dart';

class RegisterController {
  RegisterController({required this.context});

  final BuildContext context;

  FutureOr<void> handleRegister(String type) {
    if (type == "email") {
      final state = context.read<RegisterBloc>().state;
      // var fullname = state.fullname;
      var email = state.email;
      var password = state.password;


      try {
        final credentials = FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        
      } catch (e) {
        
      }
    }
  }
}
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
      debugPrint("email is ---- ${state.email}");
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
      debugPrint("password is ---- ${state.password}");
    });
    on<IsPasswordEvent>((event, emit) {
      emit(state.copyWith(isPassword: !state.isPassword));
      debugPrint("password visibility is ---- ${state.isPassword}");
    });
  }
}

part of 'login_bloc.dart';

class LoginState {
  /// initially these variables will be empty Strings
  const LoginState({
    this.email = "",
    this.password = "",
    this.isPassword = true,
  });

  final String email;
  final String password;
  final bool isPassword;

  /// creating a method called "copyWith" for updating the state variable,
  /// which will return the 'LoginState' itself.
  LoginState copyWith({
    String? email,
    String? password,
    bool? isPassword,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPassword: isPassword ?? this.isPassword,
    );
  }
}

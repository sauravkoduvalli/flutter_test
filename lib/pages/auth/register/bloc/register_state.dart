part of 'register_bloc.dart';

class RegisterState {
  RegisterState({
    this.fullname = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.isPasswordSame = true,
  });

  final String fullname;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isPasswordSame;

  RegisterState copyWith({
    String? fullname,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isPasswordSame,
  }) {
    return RegisterState(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword?? this.confirmPassword,
      isPasswordSame: isPasswordSame ?? this.isPasswordSame,
    );
  }
}

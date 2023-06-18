part of 'register_bloc.dart';

class RegisterState {
  RegisterState({
    this.fullname = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.showPassword = true,
    this.showConfirmPassword = true,
  });

  final String fullname;
  final String email;
  final String password;
  final String confirmPassword;
  final bool showPassword;
  final bool showConfirmPassword;

  RegisterState copyWith({
    String? fullname,
    String? email,
    String? password,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
  }) {
    return RegisterState(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword?? this.confirmPassword,
      showPassword: showPassword ??this.showPassword,
      showConfirmPassword: showConfirmPassword ??this.showConfirmPassword,
    );
  }
}

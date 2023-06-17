part of 'register_bloc.dart';

abstract class RegisterEvent {}

class FullNameEvent extends RegisterEvent {
  FullNameEvent(this.fullname);

  final String fullname;
}

class EmailEvent extends RegisterEvent {
  EmailEvent(this.emailAddress);

  final String emailAddress;
}

class PasswordEvent extends RegisterEvent {
  PasswordEvent(this.password);

  final String password;
}

class ConfirmPasswordEvent extends RegisterEvent {
  ConfirmPasswordEvent(this.confirmPassword);

  final String confirmPassword;
}

class ShowPasswordEvent extends RegisterEvent {
  ShowPasswordEvent();
}
class ShowConfirmPasswordEvent extends RegisterEvent {
  ShowConfirmPasswordEvent();
}

part of 'login_bloc.dart';

abstract class LoginEvent {
  
}

class EmailEvent extends LoginEvent {
  EmailEvent(this.email);
  final String email;
}
class PasswordEvent extends LoginEvent {
  PasswordEvent(this.password);
  final String password;
}
class IsPasswordEvent extends LoginEvent {
}
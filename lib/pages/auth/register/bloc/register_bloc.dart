import 'package:bloc/bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<FullNameEvent>((event, emit) {
      emit(state.copyWith(fullname: event.fullname));
      print("full name is --- ${state.fullname}");
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.emailAddress));
      print("email is --- ${state.email}");
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
      print("pass is --- ${state.password}");
    });
    on<ConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
      print("confirm pass is --- ${state.confirmPassword}");
    });
    on<ShowPasswordEvent>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
      print("show pass is --- ${!state.showPassword}");
    });
    on<ShowConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
      print("show conf pass is --- ${!state.showConfirmPassword}");
    });
   
  }
}

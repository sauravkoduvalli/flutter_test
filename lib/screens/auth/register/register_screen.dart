import 'package:first_project/utils/constant/app_validators.dart';
import 'package:first_project/widget/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/app_enum.dart';
import '../../../widget/auth_button_widget.dart';
import '../../../widget/text_form_widget.dart';
import 'bloc/register_bloc.dart';
import 'controller/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with AppValidatorsMixin {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // username
              TextFormWidget(
                onChanged: (val) {
                  context.read<RegisterBloc>().add(FullNameEvent(val));
                },
                controller: _fullNameController,
                lable: "Username",
                prefixIcon: Icons.person_2_outlined,
                type: FormFieldType.fullname,
                isPswd: false,
                keyboardAction: TextInputAction.next,
                validator: (val) {
                  if (isNotNull(val)) {
                    return "username required";
                  } else {
                    return null;
                  }
                },
              ),
              // email address
              TextFormWidget(
                onChanged: (val) {
                  context.read<RegisterBloc>().add(EmailEvent(val));
                },
                controller: _emailController,
                lable: "Email",
                prefixIcon: Icons.mail_outline,
                type: FormFieldType.email,
                isPswd: false,
                keyboardAction: TextInputAction.next,
              ),
              // password
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  return TextFormWidget(
                    onChanged: (val) {
                      context.read<RegisterBloc>().add(PasswordEvent(val));
                    },
                    controller: _passwordController,
                    lable: "Password",
                    prefixIcon: Icons.lock_outline,
                    type: FormFieldType.password,
                    isPswd: context.read<RegisterBloc>().state.showPassword,
                    keyboardAction: TextInputAction.next,
                    viewPassword: () {
                      context.read<RegisterBloc>().add(ShowPasswordEvent());
                    },
                  );
                },
              ),
              // confirm password
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  return TextFormWidget(
                    onChanged: (val) {
                      if (_passwordController.text != val) {
                        toastWidget(
                            message:
                                "Confirm password is not matching with password");
                      } else {
                        return;
                      }
                    },
                    controller: _confirmPasswordController,
                    lable: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    type: FormFieldType.password,
                    isPswd:
                        context.read<RegisterBloc>().state.showConfirmPassword,
                    keyboardAction: TextInputAction.done,
                    viewPassword: () => context
                        .read<RegisterBloc>()
                        .add(ShowConfirmPasswordEvent()),
                  );
                },
              ),
              SizedBox(height: 12.h),
              // register button
              AuthButtonWidget(
                label: "REGISTER",
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    RegisterController(context: context)
                        .handleRegister('email');
                  }
                },
              ),
              SizedBox(height: 12.h),
              // back to login button
              AuthButtonWidget(
                label: "Back To Login",
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueAccent,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

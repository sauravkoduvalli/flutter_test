import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/app_enum.dart';
import '../../../widget/auth_button_widget.dart';
import '../../../widget/text_form_widget.dart';
import '../login/controller/login_controller.dart';
import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormWidget(
              onChanged: (val) {
                context.read<RegisterBloc>().add(FullNameEvent(val));
              },
              controller: _fullNameController,
              lable: "Full Name",
              prefixIcon: Icons.person_2_outlined,
              type: FormFieldType.fullname,
              isPswd: false,
              keyboardAction: TextInputAction.next,
            ),
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
            TextFormWidget(
              onChanged: (val) {
                context.read<RegisterBloc>().add(PasswordEvent(val));
              },
              controller: _passwordController,
              lable: "Password",
              prefixIcon: Icons.lock_outline,
              type: FormFieldType.password,
              isPswd: true,
              keyboardAction: TextInputAction.next,
            ),
            TextFormWidget(
              onChanged: (val) {
                context.read<RegisterBloc>().add(ConfirmPasswordEvent(val));
                if (_passwordController.text != val) {
                  context.read<RegisterBloc>().add(IsPasswordSameEvent());
                } else {
                  return;
                }
              },
              controller: _confirmPasswordController,
              lable: "Confirm Password",
              prefixIcon: Icons.lock_outline,
              type: FormFieldType.password,
              isPswd: true,
              keyboardAction: TextInputAction.done,
            ),
            SizedBox(height: 12.h),
            AuthButtonWidget(
              label: "REGISTER",
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              onTap: () {
                LoginController(context: context).handleLogin('email');
              },
            ),
            SizedBox(height: 12.h),
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
    );
  }

  Widget _loginButton(
    BuildContext context,
    String label,
    Color backgroundColor,
    Color foregroundColor,
    Function()? onTap,
  ) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                fixedSize: Size(double.infinity, 40.h)),
            child: Text(label),
          ),
        ),
      ],
    );
  }
}

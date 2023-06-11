import 'package:first_project/utils/constant/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/text_form_widget.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // /// image
            // SizedBox(
            //   width: 150.w,
            //   height: 150.w,
            //   child: Image.asset("assets/images/login.png"),
            // ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return TextFormWidget(
                  onChanged: (val) {
                    context.read<LoginBloc>().add(EmailEvent(val));
                  },
                  controller: _usernameController,
                  lable: "Username",
                  prefixIcon: Icons.person_2_outlined,
                  type: FormFieldType.username,
                  isPswd: false,
                  keyboardAction: TextInputAction.next,
                );
              },
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return TextFormWidget(
                  onChanged: (val) {
                    context.read<LoginBloc>().add(PasswordEvent(val));
                  },
                  controller: _passwordController,
                  lable: "Password",
                  prefixIcon: Icons.lock_outline,
                  type: FormFieldType.password,
                  isPswd: state.isPassword,
                  keyboardAction: TextInputAction.done,
                  viewPassword: () {
                    context.read<LoginBloc>().add(IsPasswordEvent());
                  },
                );
              },
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint("forget paasword pressed");
                    },
                    child: const Text("Forgot password?"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        fixedSize: Size(double.infinity, 40.h)),
                    child: const Text("LOGIN"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

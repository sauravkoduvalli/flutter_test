import 'package:first_project/utils/constant/app_enum.dart';
import 'package:flutter/material.dart';

import '../../widget/text_form_widget.dart';

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
            TextFormWidget(
              controller: _usernameController,
              lable: "Username",
              prefixIcon: Icons.person_2_outlined,
              type: FormFieldType.username,
              isPswd: false,
            ),
            TextFormWidget(
              controller: _passwordController,
              lable: "Password",
              prefixIcon: Icons.lock_outline,
              type: FormFieldType.password,
              isPswd: isPassword,
              viewPassword: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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

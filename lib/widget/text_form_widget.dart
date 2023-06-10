import 'package:flutter/material.dart';

import '../utils/constant/app_constants.dart';
import '../utils/constant/app_enum.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.controller,
    required this.lable,
    required this.prefixIcon,
    required this.isPswd,
    required this.type,
    this.viewPassword,
  });

  final TextEditingController controller;
  final String lable;
  final IconData prefixIcon;
  final bool isPswd;
  final VoidCallback? viewPassword;
  final FormFieldType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: isPswd,
        controller: controller,
        keyboardType: AppConstant().keyboardType(type),
        decoration: InputDecoration(
          label: Text(lable),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: type == FormFieldType.password
              ? IconButton(
                  onPressed: viewPassword,
                  icon: const Icon(Icons.remove_red_eye_outlined))
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }


}
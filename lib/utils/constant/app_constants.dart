import 'package:flutter/material.dart';

import 'app_enum.dart';

class AppConstant {
  keyboardType(FormFieldType type) {
    switch (type) {
      case FormFieldType.username:
        TextInputType.text;
        break;
      case FormFieldType.fullname:
        TextInputType.name;
        break;
      case FormFieldType.email:
        TextInputType.emailAddress;
        break;
      case FormFieldType.password:
        TextInputType.visiblePassword;
        break;
      default:
        TextInputType.text;
    }
  }

  
}

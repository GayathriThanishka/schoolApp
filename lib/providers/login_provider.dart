import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../routers/page_router.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter valid email id";
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter valid password";
    }
    return null;
  }

  void submitButtonClickEvent({required GlobalKey<FormState> appkey}) {
    if (appkey.currentState!.validate()) {
      return goRouter.goNamed('addstudent');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:neefs/injection_container.dart';

abstract class Validation {}

class LoginValidation extends Validation {
  static bool get isValid {
    final formKey = getIt<GlobalKey<FormState>>(instanceName: "loginFormKey");
    return formKey.currentState!.validate();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithPasswordController extends GetxController {
  final _isSignUp = (Get.arguments as bool).obs;
  final _rememberMe = false.obs;
  final _obscureText = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isSignUp => _isSignUp.value;
  bool get rememberMe => _rememberMe.value;
  bool get obscureText => _obscureText.value;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void switchSignUp() {
    _isSignUp.value = !_isSignUp.value;
    emailController.clear();
    passwordController.clear();
    _rememberMe.value = false;
    _obscureText.value = true;
  }

  void obscureToogle() => _obscureText.value = !obscureText;
  void rememberMeToogle(bool val) => _rememberMe.value = val;

  void authenticate() {}

  void authenticateFacebook() {}

  void authenticateGoogle() {}

  void authenticateApple() {}
}

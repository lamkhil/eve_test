import 'package:eve_test/app/global/widget/loading.dart';
import 'package:eve_test/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/controller/app_controller.dart';
import '../../../../global/widget/button.dart';
import '../../../../routes/app_pages.dart';

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

  Future<void> authenticate() async {
    try {
      if (emailController.text.isEmpty) {
        Get.dialog(AlertDialog(
          content: Text(
            "Email tidak boleh kosong",
            style: Get.textTheme.headline4,
          ),
          actions: [
            ButtonApp.basic(
                onPressed: () => Get.back(), child: const Text("OK"))
          ],
        ));
        return;
      }
      if (!GetUtils.isEmail(emailController.text)) {
        Get.dialog(AlertDialog(
          content: Text(
            "Email tidak valid",
            style: Get.textTheme.headline4,
          ),
          actions: [
            ButtonApp.basic(
                onPressed: () => Get.back(), child: const Text("OK"))
          ],
        ));
        return;
      }
      if (passwordController.text.isEmpty) {
        Get.dialog(AlertDialog(
          content: Text(
            "Password tidak boleh kosong",
            style: Get.textTheme.headline4,
          ),
          actions: [
            ButtonApp.basic(
                onPressed: () => Get.back(), child: const Text("OK"))
          ],
        ));
        return;
      }
      if (isSignUp) {
        LoadingDialog.basic();
        final result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        Get.find<AppController>().user = result.user;
        Get.offAllNamed(Routes.HOME);
      } else {
        LoadingDialog.basic();
        final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Get.find<AppController>().user = result.user;
        Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.dialog(AlertDialog(
        content: Text(
          e.message ?? '',
          style: Get.textTheme.headline4,
        ),
        actions: [
          ButtonApp.basic(onPressed: () => Get.back(), child: const Text("OK"))
        ],
      ));
    }
  }

  void authenticateFacebook() {
    Get.find<SignInController>().authenticateFacebook();
  }

  void authenticateGoogle() {
    Get.find<SignInController>().authenticateGoogle();
  }

  void authenticateApple() {
    Get.find<SignInController>().authenticateApple();
  }
}

import 'dart:developer';

import 'package:eve_test/app/global/controller/app_controller.dart';
import 'package:eve_test/app/global/widget/button.dart';
import 'package:eve_test/app/global/widget/loading.dart';
import 'package:eve_test/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInController extends GetxController {
  Future<void> authenticateFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // you are logged
        final AccessToken accessToken = result.accessToken!;
        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        LoadingDialog.basic();
        final firebaseAuth =
            await FirebaseAuth.instance.signInWithCredential(credential);
        Get.find<AppController>().user = firebaseAuth.user;
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      Get.dialog(AlertDialog(
        content: Text(
          "Terjadi kesalahan saat login menggunakan facebook",
          style: Get.textTheme.headline4,
        ),
        actions: [
          ButtonApp.basic(onPressed: () => Get.back(), child: const Text("OK"))
        ],
      ));
    }
  }

  void authenticateGoogle() async {
    try {
      final googleSignIn = await GoogleSignIn().signIn();
      if (googleSignIn != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignIn.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        LoadingDialog.basic();
        GoogleSignIn().signOut();
        final result =
            await FirebaseAuth.instance.signInWithCredential(credential);
        Get.find<AppController>().user = result.user;
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      Get.dialog(AlertDialog(
        content: Text(
          "Terjadi kesalahan saat login menggunakan google",
          style: Get.textTheme.headline4,
        ),
        actions: [
          ButtonApp.basic(onPressed: () => Get.back(), child: const Text("OK"))
        ],
      ));
    }
  }

  void authenticateApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      AuthCredential authCredential =
          AppleAuthProvider.credential(credential.authorizationCode);
      LoadingDialog.basic();
      final result =
          await FirebaseAuth.instance.signInWithCredential(authCredential);
      Get.find<AppController>().user = result.user;
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }
  }
}

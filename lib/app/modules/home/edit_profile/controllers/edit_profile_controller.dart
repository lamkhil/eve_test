import 'package:eve_test/app/global/controller/app_controller.dart';
import 'package:eve_test/app/global/widget/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  TextEditingController emailController =
      TextEditingController(text: Get.find<AppController>().user!.email);
  TextEditingController namaController =
      TextEditingController(text: Get.find<AppController>().user!.displayName);

  void updateProfile() async {
    LoadingDialog.basic();
    await Get.find<AppController>()
        .user!
        .updateDisplayName(namaController.text);
    Get.find<AppController>().user = FirebaseAuth.instance.currentUser;
    Get.back();
    Get.back();
  }
}

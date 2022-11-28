import 'package:eve_test/app/global/controller/app_controller.dart';
import 'package:eve_test/app/global/widget/button.dart';
import 'package:eve_test/app/global/widget/text_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../views/widget/profile_widget.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Edit Profile",
        style: Get.textTheme.headline4!.copyWith(color: Colors.white),
      )),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 100),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: Get.find<AppController>().user!.photoURL ??
                  "https://picsum.photos/200",
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFormWithLabel(
              label: 'Email',
              controller: controller.emailController,
              enable: false,
            ),
            const SizedBox(height: 24),
            TextFormWithLabel(
              label: 'Full Name',
              controller: controller.namaController,
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 10),
            ButtonApp.basic(
                onPressed: () {
                  controller.updateProfile();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text("Update Profile"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

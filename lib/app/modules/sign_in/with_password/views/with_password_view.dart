import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../global/constant/image.dart';
import '../../../../global/constant/theme.dart';
import '../../../../global/widget/button.dart';
import '../../../../global/widget/text_form.dart';
import '../controllers/with_password_controller.dart';

class WithPasswordView extends GetView<WithPasswordController> {
  const WithPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          width: Get.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              header(),
              TextFormWithLabel(
                  controller: controller.emailController,
                  label: "Email",
                  isImportance: true,
                  prefix: const Icon(IconlyBold.message),
                  hint: "Email"),
              SizedBox(
                height: 12.h,
              ),
              Obx(
                () => TextFormWithLabel(
                    controller: controller.passwordController,
                    label: "Password",
                    isImportance: true,
                    obscureText: controller.obscureText,
                    prefix: const Icon(IconlyBold.lock),
                    suffix: InkWell(
                      onTap: () {
                        controller.obscureToogle();
                      },
                      child: Icon(controller.obscureText
                          ? IconlyBold.show
                          : IconlyBold.hide),
                    ),
                    hint: "Password"),
              ),
              SizedBox(
                height: 12.h,
              ),
              Obx(() => rememberMe(
                  value: controller.rememberMe,
                  onChanged: (val) {
                    controller.rememberMeToogle(val ?? false);
                  })),
              SizedBox(
                height: 12.h,
              ),
              ButtonApp.basic(
                  onPressed: () {
                    controller.authenticate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            controller.isSignUp ? "Sign up" : "Sign in",
                            style: Get.textTheme.headline3!
                                .copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 24.h,
              ),
              orSpace(),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialRoundedButton(
                      image: ImageApps.facebookLogo,
                      onPressed: () {
                        controller.authenticateFacebook();
                      }),
                  socialRoundedButton(
                      image: ImageApps.googleLogo,
                      onPressed: () {
                        controller.authenticateGoogle();
                      }),
                  Platform.isIOS
                      ? socialRoundedButton(
                          image: ImageApps.appleLogo,
                          onPressed: () {
                            controller.authenticateApple();
                          })
                      : const SizedBox.shrink(),
                ],
              ),
              switchSignUp()
            ],
          ),
        ),
      ),
    );
  }

  IconButton socialRoundedButton(
      {required String image, required Function() onPressed}) {
    return IconButton(
        iconSize: 42,
        onPressed: onPressed,
        icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorsApp.purple, width: 0.5)),
            child: Image.asset(
              image,
            )));
  }

  Row orSpace() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "or continue with",
            style: Get.textTheme.headline4!.copyWith(color: ColorsApp.grey),
          ),
        ),
        const Expanded(child: Divider())
      ],
    );
  }

  Row rememberMe(
      {required bool value, required void Function(bool?)? onChanged}) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(color: ColorsApp.purple),
          checkColor: ColorsApp.white,
          activeColor: ColorsApp.purple,
        ),
        Text(
          "Remember Me",
          style: Get.textTheme.headline4!.copyWith(color: ColorsApp.darkBlue),
        )
      ],
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 72.h),
          child: Image.asset(
            ImageApps.logoHorizontal,
            width: 200.w,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Obx(
            () => Text(
              controller.isSignUp ? "Sign up for free" : "Let's you in",
              style: Get.textTheme.headline1,
            ),
          ),
        ),
      ],
    );
  }

  Row switchSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Text(
            !controller.isSignUp
                ? "Don’t have a account?"
                : "Already have a account?",
            style: Get.textTheme.bodyText1!.copyWith(color: ColorsApp.grey),
          ),
        ),
        InkWell(
          onTap: () {
            controller.switchSignUp();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Text(
                !controller.isSignUp ? "Sign up" : "Sign in",
                style:
                    Get.textTheme.headline4!.copyWith(color: ColorsApp.purple),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

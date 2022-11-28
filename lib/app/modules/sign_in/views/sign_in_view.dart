import 'dart:io';

import 'package:eve_test/app/global/constant/image.dart';
import 'package:eve_test/app/global/widget/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/constant/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  header(),
                  SizedBox(
                    height: 12.h,
                  ),
                  socialButton(
                      onPressed: () {
                        controller.authenticateFacebook();
                      },
                      image: ImageApps.facebookLogo,
                      title: "Facebook"),
                  SizedBox(
                    height: 12.h,
                  ),
                  socialButton(
                      onPressed: () {
                        controller.authenticateGoogle();
                      },
                      image: ImageApps.googleLogo,
                      title: "Google"),
                  SizedBox(
                    height: 12.h,
                  ),
                  Platform.isIOS
                      ? socialButton(
                          onPressed: () {
                            controller.authenticateApple();
                          },
                          image: ImageApps.appleLogo,
                          title: "Apple")
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: 12.h,
                  ),
                  orSpace(),
                  SizedBox(
                    height: 12.h,
                  ),
                  withPasswordButton(),
                  SizedBox(
                    height: 12.h,
                  ),
                  signUp()
                ],
              ),
            ),
          ),
        ),
      ),
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
            ImageApps.logoText,
            height: 150.h,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            "Let's you in",
            style: Get.textTheme.headline1,
          ),
        ),
      ],
    );
  }

  Row signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have a account?",
          style: Get.textTheme.bodyText1!.copyWith(color: ColorsApp.grey),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.WITH_PASSWORD, arguments: true);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sign up",
              style: Get.textTheme.headline4!.copyWith(color: ColorsApp.purple),
            ),
          ),
        ),
      ],
    );
  }

  Widget withPasswordButton() {
    return ButtonApp.basic(
        onPressed: () {
          Get.toNamed(Routes.WITH_PASSWORD, arguments: false);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign in with password",
                style: Get.textTheme.headline3!.copyWith(color: Colors.white),
              )
            ],
          ),
        ));
  }

  Widget socialButton(
      {required Function() onPressed,
      required String image,
      required String title}) {
    return ButtonApp.outline(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    image,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                flex: 9,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Get.textTheme.headline3,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Row orSpace() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "OR",
            style: Get.textTheme.headline4!.copyWith(color: ColorsApp.grey),
          ),
        ),
        const Expanded(child: Divider())
      ],
    );
  }
}

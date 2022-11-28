import 'package:eve_test/app/global/constant/image.dart';
import 'package:eve_test/app/global/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.purple,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -115,
                right: -115,
                child: Obx(() {
                  return AnimatedContainer(
                    height: 645.h,
                    width: 645.w,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(controller.container1Opacity),
                        shape: BoxShape.circle),
                  );
                }),
              ),
              Positioned(
                left: -45,
                right: -45,
                child: Obx(() {
                  return AnimatedContainer(
                    height: 500.h,
                    width: 500.w,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(controller.container2Opacity),
                        shape: BoxShape.circle),
                  );
                }),
              ),
              Align(
                alignment: Alignment.center,
                child: Obx(() {
                  return AnimatedContainer(
                    height: 300.h,
                    width: 300.w,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(controller.container3Opacity),
                        shape: BoxShape.circle),
                  );
                }),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Obx(
                    () => AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: controller.logoOpacity,
                        child: Image.asset(
                          ImageApps.logoWhite,
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ),
              Positioned(
                  bottom: 25.h,
                  child: Obx(
                    () => controller.showLoading
                        ? SpinKitCircle(
                            color: Colors.white,
                            size: 50.r,
                          )
                        : const SizedBox.shrink(),
                  ))
            ],
          ),
        ));
  }
}

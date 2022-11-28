import 'package:eve_test/app/global/controller/app_controller.dart';
import 'package:eve_test/app/global/widget/button.dart';
import 'package:eve_test/app/modules/home/views/widget/number_widget.dart';
import 'package:eve_test/app/modules/home/views/widget/profile_widget.dart';
import 'package:eve_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 52),
            ProfileWidget(
              imagePath: Get.find<AppController>().user!.photoURL ??
                  'https://picsum.photos/200',
              onClicked: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
            ),
            const SizedBox(height: 24),
            nama(),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
            NumbersWidget(),
            const SizedBox(height: 48),
            about(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ButtonApp.basic(
                  onPressed: () {
                    controller.logout();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log out",
                          style: Get.textTheme.headline1!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 52),
          ],
        ),
      ),
    );
  }

  Widget nama() => Column(
        children: [
          Obx(
            () => Text(
              Get.find<AppController>().user!.displayName ?? "",
              style: Get.textTheme.headline1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            Get.find<AppController>().user!.email ?? "",
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget about() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

import 'package:get/get.dart';

import '../controllers/with_password_controller.dart';

class WithPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithPasswordController>(
      () => WithPasswordController(),
    );
  }
}

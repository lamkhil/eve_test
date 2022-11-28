import 'package:eve_test/app/global/controller/app_controller.dart';
import 'package:eve_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final _container1Opacity = 0.0.obs;
  final _container2Opacity = 0.0.obs;
  final _container3Opacity = 0.0.obs;
  final _logoOpacity = 0.0.obs;

  final _showLoading = false.obs;

  double get container1Opacity => _container1Opacity.value;
  double get container2Opacity => _container2Opacity.value;
  double get container3Opacity => _container3Opacity.value;
  double get logoOpacity => _logoOpacity.value;
  bool get showLoading => _showLoading.value;

  @override
  void onReady() {
    onAnimated();
    onRedirect();
    super.onReady();
  }

  void onAnimated() async {
    _container1Opacity.value = 0.2;
    await Future.delayed(const Duration(milliseconds: 300));
    _container2Opacity.value = 0.2;
    await Future.delayed(const Duration(milliseconds: 300));
    _container3Opacity.value = 0.2;
    await Future.delayed(const Duration(milliseconds: 300));
    _logoOpacity.value = 1;
    await Future.delayed(const Duration(milliseconds: 300));
    _showLoading.value = true;
  }

  void onRedirect() async {
    await Future.delayed(const Duration(seconds: 5));
    if (Get.find<AppController>().user == null) {
      Get.offNamed(Routes.SIGN_IN);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }
}

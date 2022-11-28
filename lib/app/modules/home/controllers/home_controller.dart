import 'package:eve_test/app/global/widget/loading.dart';
import 'package:eve_test/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void logout() async {
    LoadingDialog.basic();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SIGN_IN);
  }
}

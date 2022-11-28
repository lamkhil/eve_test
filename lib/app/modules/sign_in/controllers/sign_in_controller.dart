import 'package:eve_test/app/global/controller/app_controller.dart';
import 'package:eve_test/app/global/widget/loading.dart';
import 'package:eve_test/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  void authenticateFacebook() {}

  void authenticateGoogle() async {
    LoadingDialog.basic();
    final googleSignIn = await GoogleSignIn().signIn();
    if (googleSignIn != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignIn.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Get.find<AppController>().user = result.user;
      Get.offAllNamed(Routes.HOME);
    }
  }

  void authenticateApple() {}
}

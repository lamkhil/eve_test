import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final Rx<User?> _user = Rx(null);
  User? get user => _user.value;
  set user(User? val) => _user.value = val;

  @override
  void onInit() {
    _user.value = FirebaseAuth.instance.currentUser;
    super.onInit();
  }
}

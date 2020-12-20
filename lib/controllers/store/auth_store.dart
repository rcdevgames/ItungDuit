import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../helpers/session.dart';
import '../../core/routes/routes.dart';

class AuthStore extends BaseController {
  AuthStore(this._storage);

  static AuthStore get to => Get.find();

  final Sessions _storage;

  @override
  void onInit() {
    
    super.onInit();
  }

  fireRoute(logged) {
    if (logged) {
      Get.offNamedUntil(Routes.home, (route) => false);
    }
  }

  Future<void> logout() {
    update();
  }
}
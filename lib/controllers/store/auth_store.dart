import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../helpers/session.dart';
import '../../core/routes/routes.dart';

class AuthStore extends BaseController {
  AuthStore(this._storage);

  static AuthStore get to => Get.find();
  static const USER = 'USER';
  final Sessions _storage;

  String user;

  final _isLogged = false.obs;

  @override
  void onInit() {
    ever(_isLogged, fireRoute);
    super.onInit();
    init();
  }

  Future init() {
    user = _storage.load(USER);
  }

  fireRoute(logged) {
    if (!logged) {
      Get.offNamedUntil(Routes.login, (route) => false);
    }
  }

  Future<void> logout() {
    update();
  }
}
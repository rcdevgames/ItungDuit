import 'package:get/get.dart';

import '../../../helpers/session.dart';
import '../../../controllers/store/auth_store.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Sessions>(SessionsImpl(), permanent: true);
    Get.put<AuthStore>(AuthStore(Get.find()), permanent: true);
  }

}
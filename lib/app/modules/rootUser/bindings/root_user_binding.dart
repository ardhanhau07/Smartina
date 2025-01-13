import 'package:get/get.dart';

import '../controllers/root_user_controller.dart';

class RootUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootUserController>(
      () => RootUserController(),
    );
  }
}

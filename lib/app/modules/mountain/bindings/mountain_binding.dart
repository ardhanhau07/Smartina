import 'package:get/get.dart';

import '../controllers/mountain_controller.dart';

class MountainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MountainController>(
      () => MountainController(),
    );
  }
}

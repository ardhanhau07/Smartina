import 'package:get/get.dart';

import '../controllers/sholat_controller.dart';

class SholatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SholatController>(
      () => SholatController(),
    );
  }
}

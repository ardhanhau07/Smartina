import 'package:get/get.dart';

import '../controllers/pengaturan_sholat_controller.dart';

class PengaturanSholatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengaturanSholatController>(
      () => PengaturanSholatController(),
    );
  }
}

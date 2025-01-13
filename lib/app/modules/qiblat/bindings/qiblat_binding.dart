import 'package:get/get.dart';

import '../controllers/qiblat_controller.dart';

class QiblatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QiblatController>(
      () => QiblatController(),
    );
  }
}

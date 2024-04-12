import 'package:get/get.dart';

import '../controllers/librari_controller.dart';

class LibrariBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibrariController>(
      () => LibrariController(),
    );
  }
}

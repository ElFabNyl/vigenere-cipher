import 'package:get/get.dart';

import '../control/brainctrl.dart';

class InitializeDepedencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>Brainctrl());
  }

}
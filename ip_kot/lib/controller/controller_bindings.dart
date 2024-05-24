import 'package:get/get.dart';
import 'package:ip_kot/controller/ip_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<IPController>(IPController());
  }
}

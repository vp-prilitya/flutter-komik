import 'package:get/instance_manager.dart';
import 'package:komik/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
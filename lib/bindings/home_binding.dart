import 'package:get/get.dart';
import 'package:superhero_flutter/controllers/home_controller.dart';
import 'package:superhero_flutter/services/http_service_impl.dart';

class HomeBinding extends Bindings{


  @override
  void dependencies() {
    Get.put(HttpServiceImpl());
    Get.put(HomeController());
  }
}
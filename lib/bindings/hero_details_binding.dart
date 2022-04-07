import 'package:get/get.dart';
import 'package:superhero_flutter/controllers/hero_details_controller.dart';

class HeroDetailsBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(HeroDetailsController());
  }

}
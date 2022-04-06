import 'package:get/get.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/services/http_service.dart';
import 'package:superhero_flutter/services/http_service_impl.dart';

class HomeController extends GetxController {
  late HttpService _httpService;

  HomeController() {
    _httpService = Get.find<HttpServiceImpl>();
    getSuperheroes();
  }

  var isLoading = false.obs;
  late RxList<Superhero> heroes;

  void getSuperheroes() async {
    isLoading.value = true;
    var result = await _httpService.getSuperheroes();
    isLoading.value = false;
    heroes = result.obs;
  }

}

import 'package:get/get.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/services/http_service.dart';
import 'package:superhero_flutter/services/http_service_impl.dart';

class HeroDetailsController extends GetxController{

  late HttpService _httpService;

  HeroDetailsController() {
    _httpService = Get.find<HttpServiceImpl>();
  }

  var isLoading = false.obs;
  late Rx<Superhero?> hero;

  getHeroDetails(String heroId) async{
    print("<<<<<<FETCHING>>>>>>");
    isLoading.value = true;
    var result = await _httpService.getSuperheroDetails(heroId);
    isLoading.value = false;
    hero = result.obs;
  }


}
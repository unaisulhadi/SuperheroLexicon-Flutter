import 'package:get/get.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/services/http_service.dart';
import 'package:superhero_flutter/services/http_service_impl.dart';

class HomeController extends GetxController {
  late HttpService _httpService;

  HomeController() {
    _httpService = Get.find<HttpServiceImpl>();
    fetchSuperheroes();
  }

  var isLoading = false.obs;
  RxList<Superhero> heroes = <Superhero>[].obs;
  RxList<Superhero> searchList = <Superhero>[].obs;

  RxString searchKey = "".obs;

  void fetchSuperheroes() async {
    isLoading.value = true;
    var result = await _httpService.getSuperheroes();
    isLoading.value = false;
    heroes.value = result;
  }

  List<Superhero> getHeroes(){
    return heroes.where((hero) => hero.name.toLowerCase().contains(searchKey.toLowerCase())).toList();
  }

  // void searchSuperhero(){
  //   searchList.value
  //   =
  // }

}

import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/services/http_service.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/";


class HttpServiceImpl implements HttpService{

  @override
  Future<List<Superhero>> getSuperheroes() async {
    try {
      var result = await http.get(Uri.parse(BASE_URL + "all.json"));
      if (result.statusCode == 200) {
        var response = superheroesFromJson(result.body);
        return response;
      } else {
        print(result.reasonPhrase);
        return [];
      }
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<Superhero?> getSuperheroDetails(String heroId) async{
    try {
      var result = await http.get(Uri.parse(BASE_URL + "id/$heroId.json"));
      if (result.statusCode == 200) {
        var response = superheroFromJson(result.body);
        print(response.name);
        return response;
      } else {
        print(result.reasonPhrase);
        return null;
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

}
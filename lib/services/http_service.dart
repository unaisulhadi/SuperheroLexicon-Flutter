
import 'package:superhero_flutter/model/superhero.dart';

abstract class HttpService {
  Future<List<Superhero>> getSuperheroes();
  Future<Superhero?> superheroDetails(String heroId);
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/controllers/hero_details_controller.dart';
import 'package:superhero_flutter/model/superhero.dart';

class HeroDetailsScreen extends StatelessWidget {
  static const route = "/hero_details";

  const HeroDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HeroDetailsController>();
    final heroId = Get.arguments['heroId'] ?? 0;

    controller.getHeroDetails(heroId.toString());

    return Scaffold(
        body: Obx(() => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.hero.value == null
                ? const Center(
                    child: Text(
                      "Something went wrong!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                : HeroDetails(superhero: controller.hero.value!)));
  }
}

class HeroDetails extends StatelessWidget {
  Superhero superhero;

  HeroDetails({required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          superhero.images.lg,
          height: 500,
          width: double.infinity,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/components/hero_bio.dart';
import 'package:superhero_flutter/controllers/hero_details_controller.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroDetailsScreen extends StatelessWidget {
  static const route = "/hero_details";

  const HeroDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HeroDetailsController>();
    final heroId = Get.arguments['heroId'] ?? 0;

    controller.getHeroDetails(heroId.toString());

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Obx(() => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryTextColor,
                ),
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children :[
              Image.network(
                superhero.images.lg,
                height: 480,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: double.infinity,
                height: 100,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, primaryDark.withOpacity(0.8)],
                    )),
                child: Text(
                  superhero.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          HeroBio(biography: superhero.biography,name: superhero.name,)
        ],
      ),
    );
  }
}

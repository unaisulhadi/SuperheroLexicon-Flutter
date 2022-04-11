import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/components/hero_aliases.dart';
import 'package:superhero_flutter/components/hero_appearance.dart';
import 'package:superhero_flutter/components/hero_bio.dart';
import 'package:superhero_flutter/components/hero_more_details.dart';
import 'package:superhero_flutter/components/hero_power_stats.dart';
import 'package:superhero_flutter/controllers/hero_details_controller.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroDetailsScreen extends StatelessWidget {
  static const route = "/hero_details";

  HeroDetailsScreen({Key? key}) : super(key: key);
  final controller = Get.find<HeroDetailsController>();
  final heroId = Get.arguments['heroId'] ?? 0;

  @override
  Widget build(BuildContext context) {
    controller.getHeroDetails(heroId.toString());
    print("BUILD DETAILS.......");

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
            children: [
              Image.network(
                superhero.images.lg,
                height: 460,
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
          HeroBio(
            biography: superhero.biography,
            name: superhero.name,
          ),
          HeroPowerStats(powerstats: superhero.powerstats),
          HeroAliases(aliases: superhero.biography.aliases),
          HeroAppearance(appearance: superhero.appearance),
          HeroMoreDetails(
              title: "OCCUPATION", details: superhero.work.occupation),
          HeroMoreDetails(title: "BASE", details: superhero.work.base),
          HeroMoreDetails(
              title: "GROUP AFFILIATION",
              details: superhero.connections?.groupAffiliation ?? "-"),
          HeroMoreDetails(
              title: "RELATIVES",
              details: superhero.connections?.relatives ?? "-"),
        ],
      ),
    );
  }
}

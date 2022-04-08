import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/components/hero_item.dart';
import 'package:superhero_flutter/controllers/home_controller.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/screens/hero_details_screen.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(
              left: 8, top: statusBarHeight + 12, right: 8, bottom: 6),
          child: const Text(
            "Explore",
            style: TextStyle(
                color: primaryTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w800),
          ),
        ),
        Obx(() => controller.isLoading.isTrue
            ? const Expanded(
              child: Center(
                  child: CircularProgressIndicator(
                    color: primaryTextColor,
                  ),
                ),
            )
            : Expanded(
                child: controller.heroes.isEmpty
                    ? const Center(
                        child: Text(
                        "Looks like there is no one left..!!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ))
                    : GridView.builder(
                        padding: const EdgeInsets.all(0.0),
                        itemCount: controller.heroes.length,
                        itemBuilder: (context, index) {
                          var item = controller.heroes[index];
                          return HeroItem(
                            superhero: item,
                            onHeroClick: (Superhero hero) {
                              // print(hero.name);
                              Get.toNamed(HeroDetailsScreen.route,
                                  arguments: {'heroId': hero.id});
                            },
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                        ),
                      )))
      ]),
    );
  }
}

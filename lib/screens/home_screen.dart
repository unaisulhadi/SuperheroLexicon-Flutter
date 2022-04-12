import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/components/hero_item.dart';
import 'package:superhero_flutter/controllers/home_controller.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/screens/hero_details_screen.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  final searchTextController = TextEditingController();

  Widget build(BuildContext context) {
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
                    ? EmptyHeroes()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryTextColor,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6))),
                              child: TextField(
                                controller: searchTextController,
                                maxLines: 1,
                                onChanged: (value) {
                                  controller.searchKey.value = value;
                                  //controller.searchSuperhero();
                                },
                                keyboardType: TextInputType.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: primaryTextColor.withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          // Text('Hero Count: ${controller.getHeroes().length}',
                          //   style: const TextStyle(
                          //       fontSize: 24,
                          //       color: Colors.white
                          //   ),),
                          controller.getHeroes().isNotEmpty ?
                          HeroList(
                            heroes: controller.getHeroes(),
                            controller: controller,
                          ) : EmptyHeroes(message: "No results found!")
                        ],
                      )))
      ]),
    );
  }
}

class EmptyHeroes extends StatelessWidget {
  String message;
  EmptyHeroes({
    this.message = "Looks like there is no one left..!!",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ));
  }
}

class HeroList extends StatelessWidget {
  HomeController controller;
  List<Superhero> heroes;

  HeroList({required this.controller, required this.heroes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: heroes.length,
        itemBuilder: (context, index) {
          var item = heroes[index];
          return HeroItem(
            superhero: item,
            onHeroClick: (Superhero hero) {
              // print(hero.name);
              Get.toNamed(HeroDetailsScreen.route,
                  arguments: {'heroId': hero.id});
            },
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
        ),
      ),
    );
  }
}

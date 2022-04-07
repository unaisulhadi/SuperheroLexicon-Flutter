import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/components/superhero_item.dart';
import 'package:superhero_flutter/controllers/home_controller.dart';
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Obx(() {
              return controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
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
                                return SuperheroItem(superhero: item);
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3/4,
                              ),
                            ));
            })
          ]),
    );
  }
}

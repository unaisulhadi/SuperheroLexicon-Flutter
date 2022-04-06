import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/controllers/home_controller.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(12, statusBarHeight + 4, 12, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Text(
            "Explore",
            style: TextStyle(
                color: primaryTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w800),
          ),
          Obx(() {
            return controller.isLoading.isTrue
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: controller.heroes.isEmpty
                  ? const Center(
                  child: Text("Looks like there is no one left"))
                  : ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = controller.heroes[index];
                  return GestureDetector(
                      onTap: () {
                        // Get.toNamed("/crypto_detail",parameters: {"coin_id":item.id,
                        //   "coin_name":item.name});
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(item.images.sm),
                        ),
                        title: Text(item.name,style : const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        )),
                        subtitle: Text(item.biography.fullName,style : const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                        )),

                      )
                  );
                },
                itemCount: controller.heroes.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 24,);
                },),);
          })
        ]),
      ),
    );
  }
}

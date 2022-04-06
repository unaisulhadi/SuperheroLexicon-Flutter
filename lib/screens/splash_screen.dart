import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero_flutter/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {

  static const route = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Splash"),
            ElevatedButton(onPressed: () {
              Get.toNamed(HomeScreen.route);
            }, child: Text("Go to Home"))
          ],
        ),
      ),
    );
  }
}

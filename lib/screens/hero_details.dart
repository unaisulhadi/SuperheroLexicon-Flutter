import 'package:flutter/material.dart';

class HeroDetails extends StatelessWidget {

  static const route = "/hero_details";
  const HeroDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hero Details"),
      ),
    );
  }
}

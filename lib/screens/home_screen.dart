import 'package:flutter/material.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: const Text(
          "HELLO WORLD!!",
          style: TextStyle(
            color: primaryTextColor,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: const Text("HELLO WORLD!!",
        style: TextStyle(
          color: primaryTextColor,
        ),),
      ),
    );
  }
}

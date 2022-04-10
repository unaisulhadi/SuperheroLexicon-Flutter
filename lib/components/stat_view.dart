import 'package:flutter/material.dart';
import 'package:superhero_flutter/theme/colors.dart';

class StatView extends StatelessWidget {
  String title;
  int value;

  StatView({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 65,
                height: 65,
                child: CircularProgressIndicator(
                  value: value.toDouble(),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(primaryTextColor),
                  color: Colors.white,
                ),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          )
        ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroBioItem extends StatelessWidget {
  String bioItem;
  String iconRes;
  String title;

  HeroBioItem({
    required this.bioItem,
    required this.iconRes,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: primaryTextColor,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(iconRes, height: 20, width: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Text(
                  bioItem,
                  style: const TextStyle(
                      color: primaryDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

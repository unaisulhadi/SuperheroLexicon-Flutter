import 'package:flutter/material.dart';
import 'package:superhero_flutter/components/hero_bio_item.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroAppearance extends StatelessWidget {
  Appearance appearance;

  HeroAppearance({required this.appearance});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "APPEARANCE",
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: HeroBioItem(
                        bioItem: appearance.gender,
                        iconRes: "assets/icons/ic_gender.png",
                        title: "Gender"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HeroBioItem(
                        bioItem: appearance.race ?? "-",
                        iconRes: "assets/icons/ic_race.png",
                        title: "Race"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: HeroBioItem(
                        bioItem: appearance.height[0] +
                            " inches\n" +
                            appearance.height[1],
                        iconRes: "assets/icons/ic_height_2.png",
                        title: "Height"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HeroBioItem(
                        bioItem: appearance.weight[0] +
                            "\n" +
                            appearance.weight[1] ,
                        iconRes: "assets/icons/ic_weight.png",
                        title: "Weight"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: HeroBioItem(
                        bioItem: appearance.eyeColor,
                        iconRes: "assets/icons/ic_eye.png",
                        title: "Eye Color"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: HeroBioItem(
                        bioItem: appearance.hairColor,
                        iconRes: "assets/icons/ic_hair.png",
                        title: "Hair Color"),
                  ),
                ],
              ),
            ]));
  }
}

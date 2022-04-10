import 'package:flutter/material.dart';
import 'package:superhero_flutter/components/stat_view.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroPowerStats extends StatelessWidget {

  Powerstats powerstats;
  HeroPowerStats({required this.powerstats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "POWER STATS",
            style: TextStyle(
                color: primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: StatView(title: "Intelligence", value: powerstats.intelligence)),
              Expanded(child: StatView(title: "Strength", value: powerstats.strength)),
              Expanded(child: StatView(title: "Speed", value: powerstats.speed))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: StatView(title: "Durability", value: powerstats.intelligence)),
              Expanded(child: StatView(title: "Power", value: powerstats.strength)),
              Expanded(child: StatView(title: "Combat", value: powerstats.speed))
            ],
          ),
        ],
      ),
    );
  }
}

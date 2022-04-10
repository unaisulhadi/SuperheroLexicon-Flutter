import 'package:flutter/material.dart';
import 'package:superhero_flutter/components/hero_bio_item.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroBio extends StatelessWidget {
  Biography biography;
  String name;

  HeroBio({required this.biography, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "BIO",
            style: TextStyle(
                color: primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          HeroBioItem(
              bioItem: name,
              iconRes: "assets/icons/ic_name.png",
              title: "Name"),
          const SizedBox(height: 8),
          HeroBioItem(
              bioItem: biography.fullName,
              iconRes: "assets/icons/ic_full_name.png",
              title: "Full Name"),
          const SizedBox(height: 8),
          HeroBioItem(
              bioItem: biography.alterEgos,
              iconRes: "assets/icons/ic_mirror.png",
              title: "Alter Ego"),
          const SizedBox(height: 8),
          HeroBioItem(
              bioItem: biography.placeOfBirth,
              iconRes: "assets/icons/ic_place_of_birth.png",
              title: "Place of Birth"),
          const SizedBox(height: 8),
          HeroBioItem(
              bioItem: biography.firstAppearance,
              iconRes: "assets/icons/ic_first_appearance.png",
              title: "First Appearance"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: HeroBioItem(
                    bioItem: biography.publisher ?? "-",
                    iconRes: "assets/icons/ic_publisher.png",
                    title: "Publisher"),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: HeroBioItem(
                    bioItem: biography.alignment.toUpperCase(),
                    iconRes: "assets/icons/ic_alignment.png",
                    title: "Alignment"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

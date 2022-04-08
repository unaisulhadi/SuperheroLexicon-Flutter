import 'package:flutter/material.dart';
import 'package:superhero_flutter/model/superhero.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroItem extends StatelessWidget {
  late Superhero superhero;
  final Function(Superhero) onHeroClick;

  HeroItem({required this.superhero, required this.onHeroClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onHeroClick(superhero),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  superhero.images.md,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, primaryDark.withOpacity(0.8)],
                  )),
                  child: Text(
                    superhero.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

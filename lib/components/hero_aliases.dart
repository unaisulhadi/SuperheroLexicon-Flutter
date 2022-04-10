import 'package:flutter/material.dart';
import 'package:superhero_flutter/theme/colors.dart';

class HeroAliases extends StatelessWidget {
  List<String> aliases;

  HeroAliases({required this.aliases});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ALIASES",
              style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            aliases.isNotEmpty
                ? Row(
                    children: aliases
                        .map((item) => Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      color: primaryTextColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: primaryDark,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8)
                              ],
                            ))
                        .toList(),
                  )
                : Container(
                    child: const Text(
                      "No aliases found..!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
          ]),
    );
  }
}

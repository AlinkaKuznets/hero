import 'package:flutter/material.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/hero_screen.dart';

class HeroCard extends StatelessWidget {
  final HeroClass hero;

  const HeroCard(this.hero, {super.key});

  void selectHero(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => HeroScreen(
          id: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () {
          selectHero(context, hero.id);
        },
        child: Column(
          children: [
            Image.network(
              hero.image,
              height: 80,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 4,
              ),
            ),
            Text(
              hero.name,
              style: const TextStyle(
                color: Color.fromARGB(255, 101, 5, 5),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      hero.species,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      hero.location.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

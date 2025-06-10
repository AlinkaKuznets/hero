import 'package:flutter/material.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/favorite_button.dart';
import 'package:hero/hero_screen.dart';

class HeroCard extends StatelessWidget {
  final HeroClass hero;

  const HeroCard(this.hero, {super.key});

  void selectHero(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => HeroScreen(id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () => selectHero(context, hero.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  hero.image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: const StarBorder(),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      child: FavoriteButton(hero)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                hero.name,
                style: const TextStyle(
                  color: Color.fromARGB(255, 101, 5, 5),
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      hero.species,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      hero.location.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
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

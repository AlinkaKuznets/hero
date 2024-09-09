import 'package:hero/domain/model/hero.dart';

class StorageSource {
  final _favoriteHeroes = <HeroClass>[];

  List<HeroClass> get favoriteHeroes => [..._favoriteHeroes];

  Future<void> markHeroFavorite(HeroClass hero) async {
    if (_favoriteHeroes.contains(hero)) {
      _favoriteHeroes.remove(hero);
    } else {
      _favoriteHeroes.add(hero);
    }
  }
}

import 'package:hero/domain/model/hero.dart';

abstract class HeroRepository {
  Future<List<HeroClass>> getHeroes();

  Future<HeroClass> getHero(int id);

  List<HeroClass> getFavoriteHeroes();

  Future<void> markHeroFavorite(HeroClass hero);
}

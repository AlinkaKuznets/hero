import 'package:hero/domain/model/hero.dart';

abstract class HeroRepository {
  Future<List<HeroClass>> getHeroes(int page);

  Future<HeroClass> getHero(int id);

  Future<List<HeroClass>> getFavoriteHeroes();

  Future<void> markHeroFavorite(HeroClass hero);
}

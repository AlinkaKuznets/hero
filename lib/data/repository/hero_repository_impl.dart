import 'package:hero/data/source/rest_source.dart';
import 'package:hero/data/source/storage_source.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/domain/repository/hero_repository.dart';

class HeroRepositoryImpl implements HeroRepository {
  final RestSource _restSource;
  final StorageSource _storageSource;

  HeroRepositoryImpl({
    required RestSource restSource,
    required StorageSource storageSource,
  })  : _restSource = restSource,
        _storageSource = storageSource;

  @override
  Future<List<HeroClass>> getHeroes() {
    return _restSource.getHeroes();
  }

  @override
  Future<HeroClass> getHero(int id) {
    return _restSource.getHero(id);
  }

  @override
  List<HeroClass> getFavoriteHeroes() {
    return _storageSource.favoriteHeroes;
  }

  @override
  Future<void> markHeroFavorite(HeroClass hero) {
    return _storageSource.markHeroFavorite(hero);
  }
}

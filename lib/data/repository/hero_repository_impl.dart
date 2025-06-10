import 'package:hero/data/source/rest_source.dart';
import 'package:hero/data/source/local_storage_source.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/domain/repository/hero_repository.dart';

class HeroRepositoryImpl implements HeroRepository {
  final RestSource _restSource;
  final LocalStorageSource _storageSource;

  HeroRepositoryImpl({
    required RestSource restSource,
    required LocalStorageSource storageSource,
  })  : _restSource = restSource,
        _storageSource = storageSource;

  @override
  Future<List<HeroClass>> getHeroes(int page) async {
    final response = await _restSource.getHeroes(page);
    return response.results.map((e) => e.toDomain()).toList();
  }

  @override
  Future<HeroClass> getHero(int id) {
    return _restSource.getHero(id);
  }

  @override
  Future<List<HeroClass>> getFavoriteHeroes() {
    return _storageSource.loadFavoriteHeroes();
  }

  @override
  Future<void> markHeroFavorite(HeroClass hero) {
    return _storageSource.saveFavoriteHero(hero);
  }
}

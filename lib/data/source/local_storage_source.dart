import 'dart:convert';

import 'package:hero/data/source/dto/hero_dto.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSource {
  static const _favoriteKey = 'favorite_heroes';

  Future<List<HeroClass>> loadFavoriteHeroes() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final storedList = preferences.getString(_favoriteKey);
    if (storedList == null) return [];

    final heroes = jsonDecode(storedList) as List;
    return heroes.map((e) => HeroDto.fromJson(e).toDomain()).toList();
  }

  Future<void> saveFavoriteHero(HeroClass hero) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final savedHeroes = await loadFavoriteHeroes();
    if (savedHeroes.contains(hero)) {
      savedHeroes.remove(hero);
    } else {
      savedHeroes.add(hero);
    }
    final json = jsonEncode(
        savedHeroes.map((e) => HeroDto.fromDomain(e).toJson()).toList());
    await preferences.setString(_favoriteKey, json);
  }
}

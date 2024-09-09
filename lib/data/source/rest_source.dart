import 'dart:convert';

import 'package:hero/data/source/dto/hero_dto.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:http/http.dart' as http;

class RestSource {
  static const _baseUrl = 'https://akabab.github.io/superhero-api/api';

  String _getAllRoute() => '/all.json';
  String _getOneHeroRoute(int id) => '/id/$id.json';

  Future<List<HeroClass>> getHeroes() async {
    final response = await _get(
      _getAllRoute(),
    ).then((value) => value as List? ?? []);

    final List<HeroClass> loadedItems = [];

    for (final item in response) {
      final dto = HeroDto.fromJson(item);
      loadedItems.add(dto.toDomain());
    }

    return loadedItems;
  }

  Future<HeroClass> getHero(int id) async {
    final response = await _get(
      _getOneHeroRoute(id),
    );

    final dto = HeroDto.fromJson(response);

    return dto.toDomain();
  }

  Future<dynamic> _get(String route) async {
    final url = Uri.parse('$_baseUrl$route');
    final respose = await http.get(url);

    if (respose.statusCode >= 400) {
      throw Exception('Failed. Try again later!');
    }

    if (respose.body.isEmpty) {
      return null;
    }

    return json.decode(respose.body);
  }
}

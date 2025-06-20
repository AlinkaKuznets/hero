import 'dart:convert';

import 'package:hero/data/source/dto/hero_dto.dart';
import 'package:hero/data/source/dto/response_dto.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:http/http.dart' as http;

class RestSource {
  static const _baseUrl = 'https://rickandmortyapi.com/api/character';

  String _getAllRoute(int page) => '?page=$page';
  String _getOneHeroRoute(int id) => '/$id';

  Future<ResponseDto> getHeroes(int page) async {
    final response = await _get(
      _getAllRoute(page),
    );

    return ResponseDto.fromJson(response);
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

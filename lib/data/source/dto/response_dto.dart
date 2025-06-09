import 'package:hero/data/source/dto/hero_dto.dart';
import 'package:hero/data/source/dto/info_dto.dart';

class ResponseDto {
  ResponseDto({
    required this.info,
    required this.results,
  });

  final InfoDto info;
  final List<HeroDto> results;

  ResponseDto toDomain() => ResponseDto(info: info, results: results);

  static ResponseDto fromJson(Map<String, dynamic> json) {
    return ResponseDto(
      info: InfoDto.fromJson(json['info']),
      results: (json['results'] as List)
          .map(
            (e) => HeroDto.fromJson(e),
          )
          .toList(),
    );
  }
}

import 'package:hero/data/source/dto/appearance_dto.dart';
import 'package:hero/data/source/dto/biography_dto.dart';
import 'package:hero/data/source/dto/images_dto.dart';
import 'package:hero/domain/model/hero.dart';

class HeroDto {
  const HeroDto({
    required this.id,
    required this.name,
    required this.appearance,
    required this.image,
    required this.biography,
  });

  final int id;
  final String name;
  final AppearanceDto appearance;
  final ImagesDto image;
  final BiographyDto biography;

  HeroClass toDomain() => HeroClass(
        id: id,
        name: name,
        appearance: appearance.toDomain(),
        image: image.toDomain(),
        biography: biography.toDomain(),
      );

  factory HeroDto.fromJson(Map<String, dynamic> json) {
    return HeroDto(
      id: json['id'],
      name: json['name'],
      appearance: AppearanceDto.fromJson(json['appearance']),
      image: ImagesDto.fromJson(json['images'] ?? ''),
      biography: BiographyDto.fromJson(json['biography']),
    );
  }
}

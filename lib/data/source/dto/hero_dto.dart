import 'package:hero/data/source/dto/location_dto.dart';
import 'package:hero/domain/model/hero.dart';

class HeroDto {
  const HeroDto({
    required this.id,
    required this.name,
    required this.species,
    required this.image,
    required this.episode,
    required this.location,
  });

  final int id;
  final String name;
  final String species;
  final String image;
  final List<String> episode;
  final LocationDto location;

  HeroClass toDomain() => HeroClass(
        id: id,
        name: name,
        species: species,
        image: image,
        episode: episode,
        location: location.toDomain(),
      );

  factory HeroDto.fromJson(Map<String, dynamic> json) {
    return HeroDto(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      image: json['image'],
      episode: (json['episode'] as List).cast<String>(),
      location: LocationDto.fromJson(json['location']),
    );
  }
}

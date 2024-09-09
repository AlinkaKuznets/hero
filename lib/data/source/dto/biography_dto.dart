import 'package:hero/domain/model/biography.dart';

class BiographyDto {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  BiographyDto({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  Biography toDomain() => Biography(
        fullName: fullName,
        alterEgos: alterEgos,
        aliases: aliases,
        placeOfBirth: placeOfBirth,
        firstAppearance: firstAppearance,
        publisher: publisher,
        alignment: alignment,
      ); 

  factory BiographyDto.fromJson(Map<String, dynamic> json) {
    return BiographyDto(
      fullName: json['fullName'] ?? '',
      alterEgos: json['alterEgos'] ?? '',
      aliases: (json['aliases'] as List).cast<String>(),
      placeOfBirth: json['placeOfBirth'] ?? '',
      firstAppearance: json['firstAppearance'],
      publisher: json['publisher'] ?? '',
      alignment: json['alignment'] ?? '',
    );
  }
}

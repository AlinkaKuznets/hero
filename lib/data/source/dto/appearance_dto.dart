import 'package:hero/domain/model/appearance.dart';

class AppearanceDto {
  final String gender;
  final String race;

  AppearanceDto({required this.gender, required this.race});

  Appearance toDomain() => Appearance(
        gender: gender,
        race: race,
      );

  factory AppearanceDto.fromJson(Map<String, dynamic> json) {
    return AppearanceDto(
      gender: json['gender'] ?? '',
      race: json['race'] ??  '',
    );
  }
}

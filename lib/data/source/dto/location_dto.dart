import 'package:hero/domain/model/location.dart';

class LocationDto {
  LocationDto({
    required this.name,
  });

  final String name;

  Location toDomain() => Location(name: name);

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(name: json['name'] ?? '');
  }
}

import 'package:collection/collection.dart';
import 'package:hero/domain/model/location.dart';

class HeroClass {
  const HeroClass({
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
  final Location location;

  @override
  int get hashCode => Object.hashAll([id, name, species, image]);

  @override
  bool operator ==(Object other) {
    if (other is! HeroClass) {
      return false;
    }
    return id == other.id &&
        name == other.name &&
        species == other.species &&
        image == other.image &&
        episode.equals(other.episode);
  }
}

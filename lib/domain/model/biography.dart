import 'package:collection/collection.dart';

class Biography {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  @override
  bool operator ==(Object other) {
    if (other is! Biography) return false;
    return fullName == other.fullName &&
        alterEgos == other.alterEgos &&
        aliases.equals(other.aliases) &&
        placeOfBirth == other.placeOfBirth &&
        firstAppearance == other.firstAppearance &&
        publisher == other.publisher &&
        alignment == other.alignment;
  }

  @override
  int get hashCode => Object.hashAll([
        fullName,
        alterEgos,
        aliases,
        placeOfBirth,
        firstAppearance,
        publisher,
        alignment,
      ]);
}

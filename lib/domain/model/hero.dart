import 'package:hero/domain/model/appearance.dart';
import 'package:hero/domain/model/biography.dart';
import 'package:hero/domain/model/images.dart';

class HeroClass {
  const HeroClass({
    required this.id,
    required this.name,
    required this.appearance,
    required this.image,
    required this.biography,
  });
  final int id;
  final String name;
  final Appearance appearance;
  final Images image;
  final Biography biography;

  List<String> get images => [
        image.lg,
        image.md,
        image.sm,
        image.xs,
      ];

  @override
  int get hashCode => Object.hashAll([id, name, appearance, image, biography]);

  @override
  bool operator ==(Object other) {
    if (other is! HeroClass) {
      return false;
    }
    return id == other.id &&
        name == other.name &&
        appearance == other.appearance &&
        image == other.image &&
        biography == other.biography;
  }
}

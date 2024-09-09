class Appearance {
  final String gender;
  final String race;

  Appearance({required this.gender, required this.race});

  @override
  int get hashCode => Object.hashAll([gender, race]);

  @override
  bool operator ==(Object other) {
    if (other is! Appearance) return false;

    return gender == other.gender && race == other.race;
  }
}

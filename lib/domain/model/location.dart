class Location {
  Location({required this.name});

  final String name;

  @override
  int get hashCode => Object.hashAll([name]);

  @override
  bool operator ==(Object other) {
    if (other is! Location) return false;
    return name == other.name;
  }
}

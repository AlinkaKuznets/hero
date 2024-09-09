class Images {
  final String xs;
  final String sm;
  final String md;
  final String lg;

  Images({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  @override
  int get hashCode => Object.hashAll([xs, sm, md, lg]);

  @override
  bool operator ==(Object other) {
    if (other is! Images) return false;
    return xs == other.xs && sm == other.sm && md == other.md && lg == other.lg;
  }
}

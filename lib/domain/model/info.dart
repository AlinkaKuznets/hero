class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String next;
  final String prev;

  @override
  int get hashCode => Object.hashAll([count, pages, next, prev]);

  @override
  bool operator ==(Object other) {
    if (other is! Info) {
      return false;
    }
    return count == other.count &&
        pages == other.pages &&
        prev == other.prev &&
        next == other.next;
  }
}

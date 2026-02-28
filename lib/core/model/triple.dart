
class Triple<A, B, C> {
  const Triple(this.first, this.second, this.third);

  final A first;
  final B second;
  final C third;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Triple &&
          first == other.first &&
          second == other.second &&
          third == other.third;

  @override
  int get hashCode => Object.hash(first, second, third);

  @override
  String toString() => 'Triple($first, $second, $third)';
}

class Pair<A, B> {
  const Pair(this.first, this.second);

  final A first;
  final B second;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pair && first == other.first && second == other.second;

  @override
  int get hashCode => Object.hash(first, second);

  @override
  String toString() => 'Pair($first, $second)';
}
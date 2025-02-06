class Counter {
  final int value;
  final DateTime lastUpdated;

  Counter({
    required this.value,
    required this.lastUpdated,
  });

  Counter copyWith({
    int? value,
    DateTime? lastUpdated,
  }) {
    return Counter(
      value: value ?? this.value,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

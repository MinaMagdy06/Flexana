class FilterState {
  final String date;
  final String yogaType;
  final String instructor;
  final String level;

  const FilterState({
    this.date = "",
    this.yogaType = "",
    this.instructor = "",
    this.level = "",
  });

  FilterState copyWith({
    String? date,
    String? yogaType,
    String? instructor,
    String? level,
  }) {
    return FilterState(
      date: date ?? this.date,
      yogaType: yogaType ?? this.yogaType,
      instructor: instructor ?? this.instructor,
      level: level ?? this.level,
    );
  }
}

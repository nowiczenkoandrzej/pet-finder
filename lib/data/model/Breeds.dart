class Breeds {
  final String? primary;
  final String? secondary;
  final bool? mixed;
  final bool? unknown;

  Breeds({
    required this.primary,
    this.secondary,
    required this.mixed,
    required this.unknown,
  });

  factory Breeds.fromJson(Map<String, dynamic> json) {
    return Breeds(
      primary: json['primary'],
      secondary: json['secondary'],
      mixed: json['mixed'],
      unknown: json['unknown'],
    );
  }
}

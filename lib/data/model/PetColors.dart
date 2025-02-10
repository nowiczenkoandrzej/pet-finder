class PetColors {
  final String? primary;
  final String? secondary;
  final String? tertiary;

  PetColors({
    this.primary,
    this.secondary,
    this.tertiary,
  });

  factory PetColors.fromJson(Map<String, dynamic> json) {
    return PetColors(
      primary: json['primary'],
      secondary: json['secondary'],
      tertiary: json['tertiary'],
    );
  }
}

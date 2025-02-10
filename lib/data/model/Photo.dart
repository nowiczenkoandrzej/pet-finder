class Photo {
  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  Photo({
    required this.small,
    required this.medium,
    required this.large,
    required this.full,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
      full: json['full'],
    );
  }
}

class Video {
  final String? embed;

  Video({
    required this.embed,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      embed: json['embed'],
    );
  }
}

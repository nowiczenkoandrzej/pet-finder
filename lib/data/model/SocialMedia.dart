class SocialMedia {
  String? facebook;
  String? twitter;
  String? youtube;
  String? instagram;
  String? pinterest;

  SocialMedia({
    this.facebook,
    this.twitter,
    this.youtube,
    this.instagram,
    this.pinterest,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      facebook: json['facebook'],
      twitter: json['twitter'],
      youtube: json['youtube'],
      instagram: json['instagram'],
      pinterest: json['pinterest'],
    );
  }
}

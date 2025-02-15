class Adoption {
  String? policy;
  String? url;

  Adoption({
    this.policy,
    this.url,
  });

  factory Adoption.fromJson(Map<String, dynamic> json) {
    return Adoption(
      policy: json['policy'],
      url: json['url'],
    );
  }
}

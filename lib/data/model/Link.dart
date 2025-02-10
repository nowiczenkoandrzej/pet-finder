class Link {
  final String? href;

  Link({
    required this.href,
  });

  factory Link.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Link(href: null);
    }

    return Link(
      href: json['href'],
    );
  }
}

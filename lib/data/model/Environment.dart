class Environment {
  final bool? children;
  final bool? dogs;
  final bool? cats;

  Environment({
    this.children,
    this.dogs,
    this.cats,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      children: json['children'],
      dogs: json['dogs'],
      cats: json['cats'],
    );
  }
}

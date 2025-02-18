import 'package:hive/hive.dart';

part 'Photo.g.dart';

@HiveType(typeId: 2)
class Photo {
  @HiveField(0)
  final String? small;

  @HiveField(1)
  final String? medium;

  @HiveField(2)
  final String? large;

  @HiveField(3)
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

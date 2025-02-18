import 'package:pet_finder/data/model/Breeds.dart';
import 'package:pet_finder/data/model/Photo.dart';
import 'package:hive/hive.dart';

part 'AnimalDTO.g.dart';

@HiveType(typeId: 0)
class AnimalDTO {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String organizationId;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final String species;

  @HiveField(4)  
  final Breeds breeds;

  @HiveField(5)
  final String age;

  @HiveField(6)
  final String gender;

  @HiveField(7)
  final String name;

  @HiveField(8)
  final String? description;

  @HiveField(9)
  final List<Photo> photos;

  @HiveField(10)
  final Photo? primaryPhotoCropped;

  @HiveField(11)
  final String status;

  AnimalDTO({
    required this.id,
    required this.organizationId,
    required this.type,
    required this.species,
    required this.breeds,
    required this.age,
    required this.gender,
    required this.name,
    required this.description,
    required this.photos,
    this.primaryPhotoCropped,
    required this.status,
  });

  factory AnimalDTO.fromJson(Map<String, dynamic> json) {
    var photosList = json['photos'] as List;
    List<Photo> photos = photosList.map((i) => Photo.fromJson(i)).toList();

    return AnimalDTO(
      id: json['id'],
      organizationId: json['organization_id'],
      type: json['type'],
      species: json['species'],
      breeds: Breeds.fromJson(json['breeds']),
      age: json['age'],
      gender: json['gender'],
      name: json['name'],
      description: json['description'],
      photos: photos,
      primaryPhotoCropped: json['primary_photo_cropped'] != null
          ? Photo.fromJson(json['primary_photo_cropped'])
          : null,
      status: json['status'],
    );
  }
}

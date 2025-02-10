import 'package:pet_finder/data/model/Attributes.dart';
import 'package:pet_finder/data/model/Breeds.dart';
import 'package:pet_finder/data/model/Contact.dart';
import 'package:pet_finder/data/model/Environment.dart';
import 'package:pet_finder/data/model/Links.dart';
import 'package:pet_finder/data/model/PetColors.dart';
import 'package:pet_finder/data/model/Photo.dart';
import 'package:pet_finder/data/model/Video.dart';

class AnimalDTO {
  final int id;
  final String organizationId;
  final String url;
  final String type;
  final String species;
  final Breeds breeds;
  final PetColors? colors;
  final String age;
  final String gender;
  final String size;
  final String? coat;
  final Attributes? attributes;
  final Environment? environment;
  final List<String>? tags;
  final String name;
  final String? description;
  final String? organizationAnimalId;
  final List<Photo> photos;
  final Photo? primaryPhotoCropped;
  final List<Video>? videos;
  final String status;
  final String? statusChangedAt;
  final String? publishedAt;
  final double? distance;
  final Contact? contact;
  final Links? links;

  AnimalDTO({
    required this.id,
    required this.organizationId,
    required this.url,
    required this.type,
    required this.species,
    required this.breeds,
    required this.colors,
    required this.age,
    required this.gender,
    required this.size,
    this.coat,
    required this.attributes,
    required this.environment,
    required this.tags,
    required this.name,
    required this.description,
    this.organizationAnimalId,
    required this.photos,
    this.primaryPhotoCropped,
    required this.videos,
    required this.status,
    required this.statusChangedAt,
    required this.publishedAt,
    this.distance,
    required this.contact,
    required this.links,
  });

  factory AnimalDTO.fromJson(Map<String, dynamic> json) {
    var photosList = json['photos'] as List;
    List<Photo> photos = photosList.map((i) => Photo.fromJson(i)).toList();

    var videosList = json['videos'] as List;
    List<Video> videos = videosList.map((i) => Video.fromJson(i)).toList();

    return AnimalDTO(
      id: json['id'],
      organizationId: json['organization_id'],
      url: json['url'],
      type: json['type'],
      species: json['species'],
      breeds: Breeds.fromJson(json['breeds']),
      colors: PetColors.fromJson(json['colors']),
      age: json['age'],
      gender: json['gender'],
      size: json['size'],
      coat: json['coat'],
      attributes: Attributes.fromJson(json['attributes']),
      environment: Environment.fromJson(json['environment']),
      tags: List<String>.from(json['tags']),
      name: json['name'],
      description: json['description'],
      organizationAnimalId: json['organization_animal_id'],
      photos: photos,
      primaryPhotoCropped: json['primary_photo_cropped'] != null
          ? Photo.fromJson(json['primary_photo_cropped'])
          : null,
      videos: videos,
      status: json['status'],
      statusChangedAt: json['status_changed_at'],
      publishedAt: json['published_at'],
      distance: json['distance'],
      contact: Contact.fromJson(json['contact']),
      links: Links.fromJson(json['_links']),
    );
  }
}

import 'package:pet_finder/data/model/Address.dart';
import 'package:pet_finder/data/model/Adoption.dart';
import 'package:pet_finder/data/model/Hours.dart';
import 'package:pet_finder/data/model/Links.dart';
import 'package:pet_finder/data/model/Photo.dart';
import 'package:pet_finder/data/model/SocialMedia.dart';

class Organization {
  String id;
  String name;
  String? email;
  String? phone;
  Address address;
  Hours hours;
  String? url;
  String? website;
  String? missionStatement;
  Adoption? adoption;
  SocialMedia socialMedia;
  List<Photo> photos;
  double? distance;
  Links? links;

  Organization({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    required this.address,
    required this.hours,
    this.url,
    this.website,
    this.missionStatement,
    this.adoption,
    required this.socialMedia,
    required this.photos,
    this.distance,
    this.links,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    var photoList = json['photos'] as List? ?? []; 
    List<Photo> photosList = photoList.map((i) => Photo.fromJson(i)).toList();

    return Organization(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: Address.fromJson(json['address']),
      hours: Hours.fromJson(json['hours']),
      url: json['url'],
      website: json['website'],
      missionStatement: json['mission_statement'],
      adoption:
          json['adoption'] != null ? Adoption.fromJson(json['adoption']) : null,
      socialMedia: SocialMedia.fromJson(json['social_media']),
      photos: photosList,
      distance: json['distance'],
      links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }
}

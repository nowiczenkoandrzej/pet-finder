
import 'package:pet_finder/data/model/AnimalDTO.dart';
import 'package:pet_finder/data/model/Pagination.dart';

class AnimalsResponse {
  final List<AnimalDTO> animals;
  final Pagination? pagination;

  AnimalsResponse({required this.animals, required this.pagination});

  factory AnimalsResponse.fromJson(Map<String, dynamic> json) {
    var animalsList = json['animals'] as List;
    List<AnimalDTO> animals =
        animalsList.map((i) => AnimalDTO.fromJson(i)).toList();

    return AnimalsResponse(
      animals: animals,
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

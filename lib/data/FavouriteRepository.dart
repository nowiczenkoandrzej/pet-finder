import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_finder/data/model/AnimalDTO.dart';

class FavouriteRepository {
  static const String _boxName = 'animalBox';

  Future<Box<AnimalDTO>> _openBox() async {
    return await Hive.openBox<AnimalDTO>(_boxName);
  }

  Future<void> addAnimal(AnimalDTO animal) async {
    final Box<AnimalDTO> box = await _openBox();
    
    await box.put(animal.id, animal);
    print(Hive.box(_boxName).get(animal.id));
  }

  Future<void> removeAnimal(int id) async {
    final Box<AnimalDTO> box = await _openBox();
    await box.delete(id);
  }

  Future<List<AnimalDTO>> getAllAnimals() async {
    final Box<AnimalDTO> box = await _openBox();
    return box.values.toList();
  }

  ValueListenable<Box<AnimalDTO>> getListenableBox() {
    return Hive.box<AnimalDTO>(_boxName).listenable();
  }
}

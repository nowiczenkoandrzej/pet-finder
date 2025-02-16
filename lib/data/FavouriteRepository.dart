import 'package:hive/hive.dart';


class FavouriteRepository {
  static const String _boxName = 'Animal_Box'; 

  Future<Box<int>> _openBox() async {
    return await Hive.openBox<int>(_boxName);
  }

  Future<void> addAnimalId(int value) async {
    final Box<int> box = await _openBox();
    await box.add(value);
  }

  Future<void> removeId(int id) async {
    final Box<int> box = await _openBox();
    await box.delete(id);
  }

  Future<List<int>> getAllId() async {
    final Box<int> box = await _openBox();
    return box.values.toList();
  }
}

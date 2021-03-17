import 'package:moor/moor.dart';
import 'package:paster/models/data.dart';

class DataProvider{
  late AppDatabase _db;
  Stream<List<DataClass>>? _items;

  Stream<List<DataClass>>? get data => _items;

  DataProvider() {
    _db = AppDatabase();
  }

  Future<void> addData(UpdateCompanion data) async {
    try {
      await _db.add(data);
    } catch (e, f) {
      print('$e\n$f');
    }
  }

  Future<void> remove(UpdateCompanion data) async {
    try {
      _db.deleteData(data);
    } catch (e, f) {
      print('$e\n$f');
      throw e;
    }
  }

  Future<void> updateData(UpdateCompanion data) async {
    try {
      await _db.updateData(data);
    } catch (e, f) {
      print('$e\n$f');
      throw e;
    }
  }
}

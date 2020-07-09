import 'package:moor/moor.dart';
import 'package:paster/models/data.dart';

class DataProvider{
  static final DataProvider _instance = DataProvider._internal();
  AppDatabase _db;
  Stream<List<DataClass>> _stream;
  Stream get data => _stream;

  DataProvider._internal();
  factory DataProvider(){
    _instance._db = AppDatabase();
    _instance._stream = _instance._db.getAll();
    return _instance;
  }
}
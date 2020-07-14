import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:paster/models/data.dart';

abstract class DataTile extends StatelessWidget {
  final AppDatabase _db;
  final DataClass data;

  DataTile(this.data) : _db = AppDatabase();

  Future<void> delete() {
    return _db.deleteData((data as dynamic).toCompanion());
  }
}

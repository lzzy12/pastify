import 'dart:io';
import 'package:async/async.dart' show StreamZip;
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor_ffi/moor_ffi.dart';

part 'data.g.dart';

enum SupportedTypes { uidai, pan, card, others }

class Data extends Table {
  IntColumn get id => integer().autoIncrement()();
}

class UIDAI extends Data {
  TextColumn get uidaiNumber => text().named('uidai')();

  TextColumn get name => text().nullable()();
}

class PANCard extends Data {
  TextColumn get panCard => text().named('pan_card_number')();

  TextColumn get holderName => text().nullable().named('holder_name')();
}

class BankCard extends Data {
  TextColumn get cardNumber => text().named('card_number')();

  TextColumn get cvv => text().nullable()();

  DateTimeColumn get expiryDate => dateTime().nullable().named('expiry_date')();
}

class Other extends Data {
  TextColumn get data => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [UIDAI, PANCard, BankCard, Other])
class AppDatabase extends _$AppDatabase {
  int get schemaVersion => 1;

  AppDatabase() : super(_openConnection());

  T _getStatement<T>(DataClass data, T statement(TableInfo table)) {
    if (data is UIDAIData) return statement(uidai);
    if (data is PANCardData) return statement(pANCard);
    if (data is BankCardData) return statement(bankCard);
    return statement(other);
  }


  Future<int> add( data) {
    // @returns generated id
    return _getStatement<InsertStatement>(data, into)
        .insert(data.toCompanion());
  }

  Future<bool> updateData(data) {
    return _getStatement<UpdateStatement>(data, update).replace(data);
  }

  Future<void> deleteData(data) {
    var table;
    if (data is UIDAIData) table = uidai;
    if (data is PANCardData) table = pANCard;
    if (data is BankCardData) table = bankCard;
    if (data is OtherData) table = other;
    return (_getStatement<DeleteStatement>(data, delete)
          ..where((tbl) => table.id.equals(data.id)))
        .go();
  }

  Stream getAll(){
    final List<Stream<List<DataClass>>> s = <Stream<List<DataClass>>>[];
    for (var table in allSchemaEntities){
      s.add(select(table).watch());
    }
    return StreamZip(s);
  }
}

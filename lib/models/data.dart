import 'dart:io';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:uuid/uuid.dart';
part 'data.g.dart';

enum SupportedTypes { uidai, pan, card, others }

class Data extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v4())();
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

  TextColumn get expiryDate => text().nullable().named('expiry_date')();
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
  static final AppDatabase _instance = AppDatabase._internal();

  AppDatabase._internal() : super(_openConnection());

  factory AppDatabase() {
    return _instance;
  }

  int get schemaVersion => 1;

  T _getStatement<T>(UpdateCompanion data, T statement(TableInfo table)) {
    if (data is UIDAICompanion) return statement(uidai);
    if (data is PANCardCompanion) return statement(pANCard);
    if (data is BankCardCompanion) return statement(bankCard);
    return statement(other);
  }

  Future<int> add(UpdateCompanion data) {
    // @returns generated id
    return _getStatement<InsertStatement>(data, into).insert(data);
  }

  Future<bool> updateData(UpdateCompanion data) {
    return _getStatement<UpdateStatement>(data, update).replace(data);
  }

  Future<void> deleteData(UpdateCompanion data) {
    var table;
    if (data is UIDAICompanion) table = uidai;
    if (data is PANCardCompanion) table = pANCard;
    if (data is BankCardCompanion) table = bankCard;
    if (data is OtherCompanion) table = other;
    return (_getStatement<DeleteStatement>(data, delete)
          ..where((tbl) => table.id.equals((data as dynamic).id.value)))
        .go();
  }

  Stream<List<UIDAIData>> get uidaiStream {
    return select(uidai).watch();
  }

  Stream<List<PANCardData>> get panStream {
    return select(pANCard).watch();
  }

  Stream<List<BankCardData>> get bankCardStream {
    return select(bankCard).watch();
  }

  Stream<List<OtherData>> get otherStream {
    return select(other).watch();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UIDAIData extends DataClass implements Insertable<UIDAIData> {
  final String id;
  final String uidaiNumber;
  final String name;

  UIDAIData({@required this.id, @required this.uidaiNumber, this.name});

  factory UIDAIData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return UIDAIData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      uidaiNumber:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}uidai']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || uidaiNumber != null) {
      map['uidai'] = Variable<String>(uidaiNumber);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  UIDAICompanion toCompanion(bool nullToAbsent) {
    return UIDAICompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      uidaiNumber: uidaiNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(uidaiNumber),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory UIDAIData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UIDAIData(
      id: serializer.fromJson<String>(json['id']),
      uidaiNumber: serializer.fromJson<String>(json['uidaiNumber']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'uidaiNumber': serializer.toJson<String>(uidaiNumber),
      'name': serializer.toJson<String>(name),
    };
  }

  UIDAIData copyWith({String id, String uidaiNumber, String name}) =>
      UIDAIData(
        id: id ?? this.id,
        uidaiNumber: uidaiNumber ?? this.uidaiNumber,
        name: name ?? this.name,
      );

  @override
  String toString() {
    return (StringBuffer('UIDAIData(')
      ..write('id: $id, ')..write('uidaiNumber: $uidaiNumber, ')..write(
          'name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(uidaiNumber.hashCode, name.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UIDAIData &&
          other.id == this.id &&
          other.uidaiNumber == this.uidaiNumber &&
          other.name == this.name);
}

class UIDAICompanion extends UpdateCompanion<UIDAIData> {
  final Value<String> id;
  final Value<String> uidaiNumber;
  final Value<String> name;

  const UIDAICompanion({
    this.id = const Value.absent(),
    this.uidaiNumber = const Value.absent(),
    this.name = const Value.absent(),
  });

  UIDAICompanion.insert({
    this.id = const Value.absent(),
    @required String uidaiNumber,
    this.name = const Value.absent(),
  }) : uidaiNumber = Value(uidaiNumber);
  static Insertable<UIDAIData> custom({
    Expression<String> id,
    Expression<String> uidaiNumber,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uidaiNumber != null) 'uidai': uidaiNumber,
      if (name != null) 'name': name,
    });
  }

  UIDAICompanion copyWith(
      {Value<String> id, Value<String> uidaiNumber, Value<String> name}) {
    return UIDAICompanion(
      id: id ?? this.id,
      uidaiNumber: uidaiNumber ?? this.uidaiNumber,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (uidaiNumber.present) {
      map['uidai'] = Variable<String>(uidaiNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UIDAICompanion(')
          ..write('id: $id, ')
          ..write('uidaiNumber: $uidaiNumber, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $UIDAITable extends UIDAI with TableInfo<$UIDAITable, UIDAIData> {
  final GeneratedDatabase _db;
  final String _alias;

  $UIDAITable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;

  @override
  GeneratedTextColumn get id => _id ??= _constructId();

  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )
      ..clientDefault = () => Uuid().v4();
  }

  final VerificationMeta _uidaiNumberMeta =
  const VerificationMeta('uidaiNumber');
  GeneratedTextColumn _uidaiNumber;

  @override
  GeneratedTextColumn get uidaiNumber =>
      _uidaiNumber ??= _constructUidaiNumber();

  GeneratedTextColumn _constructUidaiNumber() {
    return GeneratedTextColumn(
      'uidai',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, uidaiNumber, name];
  @override
  $UIDAITable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'uidai';
  @override
  final String actualTableName = 'uidai';
  @override
  VerificationContext validateIntegrity(Insertable<UIDAIData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('uidai')) {
      context.handle(_uidaiNumberMeta,
          uidaiNumber.isAcceptableOrUnknown(data['uidai'], _uidaiNumberMeta));
    } else if (isInserting) {
      context.missing(_uidaiNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  UIDAIData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UIDAIData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UIDAITable createAlias(String alias) {
    return $UIDAITable(_db, alias);
  }
}

class PANCardData extends DataClass implements Insertable<PANCardData> {
  final String id;
  final String panCard;
  final String holderName;

  PANCardData({@required this.id, @required this.panCard, this.holderName});

  factory PANCardData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return PANCardData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      panCard: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pan_card_number']),
      holderName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}holder_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || panCard != null) {
      map['pan_card_number'] = Variable<String>(panCard);
    }
    if (!nullToAbsent || holderName != null) {
      map['holder_name'] = Variable<String>(holderName);
    }
    return map;
  }

  PANCardCompanion toCompanion(bool nullToAbsent) {
    return PANCardCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      panCard: panCard == null && nullToAbsent
          ? const Value.absent()
          : Value(panCard),
      holderName: holderName == null && nullToAbsent
          ? const Value.absent()
          : Value(holderName),
    );
  }

  factory PANCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PANCardData(
      id: serializer.fromJson<String>(json['id']),
      panCard: serializer.fromJson<String>(json['panCard']),
      holderName: serializer.fromJson<String>(json['holderName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'panCard': serializer.toJson<String>(panCard),
      'holderName': serializer.toJson<String>(holderName),
    };
  }

  PANCardData copyWith({String id, String panCard, String holderName}) =>
      PANCardData(
        id: id ?? this.id,
        panCard: panCard ?? this.panCard,
        holderName: holderName ?? this.holderName,
      );

  @override
  String toString() {
    return (StringBuffer('PANCardData(')
      ..write('id: $id, ')..write('panCard: $panCard, ')
          ..write('holderName: $holderName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(panCard.hashCode, holderName.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PANCardData &&
          other.id == this.id &&
          other.panCard == this.panCard &&
          other.holderName == this.holderName);
}

class PANCardCompanion extends UpdateCompanion<PANCardData> {
  final Value<String> id;
  final Value<String> panCard;
  final Value<String> holderName;

  const PANCardCompanion({
    this.id = const Value.absent(),
    this.panCard = const Value.absent(),
    this.holderName = const Value.absent(),
  });

  PANCardCompanion.insert({
    this.id = const Value.absent(),
    @required String panCard,
    this.holderName = const Value.absent(),
  }) : panCard = Value(panCard);
  static Insertable<PANCardData> custom({
    Expression<String> id,
    Expression<String> panCard,
    Expression<String> holderName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (panCard != null) 'pan_card_number': panCard,
      if (holderName != null) 'holder_name': holderName,
    });
  }

  PANCardCompanion copyWith(
      {Value<String> id, Value<String> panCard, Value<String> holderName}) {
    return PANCardCompanion(
      id: id ?? this.id,
      panCard: panCard ?? this.panCard,
      holderName: holderName ?? this.holderName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (panCard.present) {
      map['pan_card_number'] = Variable<String>(panCard.value);
    }
    if (holderName.present) {
      map['holder_name'] = Variable<String>(holderName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PANCardCompanion(')
          ..write('id: $id, ')
          ..write('panCard: $panCard, ')
          ..write('holderName: $holderName')
          ..write(')'))
        .toString();
  }
}

class $PANCardTable extends PANCard with TableInfo<$PANCardTable, PANCardData> {
  final GeneratedDatabase _db;
  final String _alias;

  $PANCardTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;

  @override
  GeneratedTextColumn get id => _id ??= _constructId();

  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )
      ..clientDefault = () => Uuid().v4();
  }

  final VerificationMeta _panCardMeta = const VerificationMeta('panCard');
  GeneratedTextColumn _panCard;

  @override
  GeneratedTextColumn get panCard => _panCard ??= _constructPanCard();

  GeneratedTextColumn _constructPanCard() {
    return GeneratedTextColumn(
      'pan_card_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _holderNameMeta = const VerificationMeta('holderName');
  GeneratedTextColumn _holderName;
  @override
  GeneratedTextColumn get holderName => _holderName ??= _constructHolderName();
  GeneratedTextColumn _constructHolderName() {
    return GeneratedTextColumn(
      'holder_name',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, panCard, holderName];
  @override
  $PANCardTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'p_a_n_card';
  @override
  final String actualTableName = 'p_a_n_card';
  @override
  VerificationContext validateIntegrity(Insertable<PANCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('pan_card_number')) {
      context.handle(_panCardMeta,
          panCard.isAcceptableOrUnknown(data['pan_card_number'], _panCardMeta));
    } else if (isInserting) {
      context.missing(_panCardMeta);
    }
    if (data.containsKey('holder_name')) {
      context.handle(
          _holderNameMeta,
          holderName.isAcceptableOrUnknown(
              data['holder_name'], _holderNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PANCardData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PANCardData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PANCardTable createAlias(String alias) {
    return $PANCardTable(_db, alias);
  }
}

class BankCardData extends DataClass implements Insertable<BankCardData> {
  final String id;
  final String cardNumber;
  final String cvv;
  final String expiryDate;

  BankCardData({@required this.id,
    @required this.cardNumber,
    this.cvv,
    this.expiryDate});

  factory BankCardData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return BankCardData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      cardNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}card_number']),
      cvv: stringType.mapFromDatabaseResponse(data['${effectivePrefix}cvv']),
      expiryDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}expiry_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || cardNumber != null) {
      map['card_number'] = Variable<String>(cardNumber);
    }
    if (!nullToAbsent || cvv != null) {
      map['cvv'] = Variable<String>(cvv);
    }
    if (!nullToAbsent || expiryDate != null) {
      map['expiry_date'] = Variable<String>(expiryDate);
    }
    return map;
  }

  BankCardCompanion toCompanion(bool nullToAbsent) {
    return BankCardCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      cardNumber: cardNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(cardNumber),
      cvv: cvv == null && nullToAbsent ? const Value.absent() : Value(cvv),
      expiryDate: expiryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryDate),
    );
  }

  factory BankCardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BankCardData(
      id: serializer.fromJson<String>(json['id']),
      cardNumber: serializer.fromJson<String>(json['cardNumber']),
      cvv: serializer.fromJson<String>(json['cvv']),
      expiryDate: serializer.fromJson<String>(json['expiryDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cardNumber': serializer.toJson<String>(cardNumber),
      'cvv': serializer.toJson<String>(cvv),
      'expiryDate': serializer.toJson<String>(expiryDate),
    };
  }

  BankCardData copyWith(
      {String id, String cardNumber, String cvv, String expiryDate}) =>
      BankCardData(
        id: id ?? this.id,
        cardNumber: cardNumber ?? this.cardNumber,
        cvv: cvv ?? this.cvv,
        expiryDate: expiryDate ?? this.expiryDate,
      );

  @override
  String toString() {
    return (StringBuffer('BankCardData(')
      ..write('id: $id, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('cvv: $cvv, ')
          ..write('expiryDate: $expiryDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(cardNumber.hashCode, $mrjc(cvv.hashCode, expiryDate.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BankCardData &&
          other.id == this.id &&
          other.cardNumber == this.cardNumber &&
          other.cvv == this.cvv &&
          other.expiryDate == this.expiryDate);
}

class BankCardCompanion extends UpdateCompanion<BankCardData> {
  final Value<String> id;
  final Value<String> cardNumber;
  final Value<String> cvv;
  final Value<String> expiryDate;

  const BankCardCompanion({
    this.id = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.cvv = const Value.absent(),
    this.expiryDate = const Value.absent(),
  });

  BankCardCompanion.insert({
    this.id = const Value.absent(),
    @required String cardNumber,
    this.cvv = const Value.absent(),
    this.expiryDate = const Value.absent(),
  }) : cardNumber = Value(cardNumber);
  static Insertable<BankCardData> custom({
    Expression<String> id,
    Expression<String> cardNumber,
    Expression<String> cvv,
    Expression<String> expiryDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardNumber != null) 'card_number': cardNumber,
      if (cvv != null) 'cvv': cvv,
      if (expiryDate != null) 'expiry_date': expiryDate,
    });
  }

  BankCardCompanion copyWith({Value<String> id,
    Value<String> cardNumber,
    Value<String> cvv,
    Value<String> expiryDate}) {
    return BankCardCompanion(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      cvv: cvv ?? this.cvv,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cardNumber.present) {
      map['card_number'] = Variable<String>(cardNumber.value);
    }
    if (cvv.present) {
      map['cvv'] = Variable<String>(cvv.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<String>(expiryDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankCardCompanion(')
          ..write('id: $id, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('cvv: $cvv, ')
          ..write('expiryDate: $expiryDate')
          ..write(')'))
        .toString();
  }
}

class $BankCardTable extends BankCard
    with TableInfo<$BankCardTable, BankCardData> {
  final GeneratedDatabase _db;
  final String _alias;

  $BankCardTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;

  @override
  GeneratedTextColumn get id => _id ??= _constructId();

  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )
      ..clientDefault = () => Uuid().v4();
  }

  final VerificationMeta _cardNumberMeta = const VerificationMeta('cardNumber');
  GeneratedTextColumn _cardNumber;

  @override
  GeneratedTextColumn get cardNumber => _cardNumber ??= _constructCardNumber();

  GeneratedTextColumn _constructCardNumber() {
    return GeneratedTextColumn(
      'card_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cvvMeta = const VerificationMeta('cvv');
  GeneratedTextColumn _cvv;
  @override
  GeneratedTextColumn get cvv => _cvv ??= _constructCvv();

  GeneratedTextColumn _constructCvv() {
    return GeneratedTextColumn(
      'cvv',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expiryDateMeta = const VerificationMeta('expiryDate');
  GeneratedTextColumn _expiryDate;

  @override
  GeneratedTextColumn get expiryDate => _expiryDate ??= _constructExpiryDate();

  GeneratedTextColumn _constructExpiryDate() {
    return GeneratedTextColumn(
      'expiry_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, cardNumber, cvv, expiryDate];

  @override
  $BankCardTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bank_card';
  @override
  final String actualTableName = 'bank_card';
  @override
  VerificationContext validateIntegrity(Insertable<BankCardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('card_number')) {
      context.handle(
          _cardNumberMeta,
          cardNumber.isAcceptableOrUnknown(
              data['card_number'], _cardNumberMeta));
    } else if (isInserting) {
      context.missing(_cardNumberMeta);
    }
    if (data.containsKey('cvv')) {
      context.handle(
          _cvvMeta, cvv.isAcceptableOrUnknown(data['cvv'], _cvvMeta));
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date'], _expiryDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  BankCardData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BankCardData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BankCardTable createAlias(String alias) {
    return $BankCardTable(_db, alias);
  }
}

class OtherData extends DataClass implements Insertable<OtherData> {
  final String id;
  final String data;

  OtherData({@required this.id, @required this.data});

  factory OtherData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return OtherData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      data: stringType.mapFromDatabaseResponse(data['${effectivePrefix}data']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    return map;
  }

  OtherCompanion toCompanion(bool nullToAbsent) {
    return OtherCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
    );
  }

  factory OtherData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OtherData(
      id: serializer.fromJson<String>(json['id']),
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'data': serializer.toJson<String>(data),
    };
  }

  OtherData copyWith({String id, String data}) =>
      OtherData(
        id: id ?? this.id,
        data: data ?? this.data,
      );

  @override
  String toString() {
    return (StringBuffer('OtherData(')
      ..write('id: $id, ')..write('data: $data')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, data.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OtherData && other.id == this.id && other.data == this.data);
}

class OtherCompanion extends UpdateCompanion<OtherData> {
  final Value<String> id;
  final Value<String> data;

  const OtherCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
  });

  OtherCompanion.insert({
    this.id = const Value.absent(),
    @required String data,
  }) : data = Value(data);

  static Insertable<OtherData> custom({
    Expression<String> id,
    Expression<String> data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
    });
  }

  OtherCompanion copyWith({Value<String> id, Value<String> data}) {
    return OtherCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OtherCompanion(')
          ..write('id: $id, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $OtherTable extends Other with TableInfo<$OtherTable, OtherData> {
  final GeneratedDatabase _db;
  final String _alias;

  $OtherTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;

  @override
  GeneratedTextColumn get id => _id ??= _constructId();

  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )
      ..clientDefault = () => Uuid().v4();
  }

  final VerificationMeta _dataMeta = const VerificationMeta('data');
  GeneratedTextColumn _data;

  @override
  GeneratedTextColumn get data => _data ??= _constructData();

  GeneratedTextColumn _constructData() {
    return GeneratedTextColumn(
      'data',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, data];
  @override
  $OtherTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'other';
  @override
  final String actualTableName = 'other';
  @override
  VerificationContext validateIntegrity(Insertable<OtherData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data'], _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  OtherData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OtherData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OtherTable createAlias(String alias) {
    return $OtherTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UIDAITable _uidai;
  $UIDAITable get uidai => _uidai ??= $UIDAITable(this);
  $PANCardTable _pANCard;
  $PANCardTable get pANCard => _pANCard ??= $PANCardTable(this);
  $BankCardTable _bankCard;
  $BankCardTable get bankCard => _bankCard ??= $BankCardTable(this);
  $OtherTable _other;
  $OtherTable get other => _other ??= $OtherTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [uidai, pANCard, bankCard, other];
}

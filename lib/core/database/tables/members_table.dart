import 'package:drift/drift.dart';

class Members extends Table {
  TextColumn get id => text()();
  TextColumn get groupId => text()();
  TextColumn get fullName => text()();
  TextColumn get photoUrl => text().nullable()();
  TextColumn get familyInfo => text().nullable()();
  TextColumn get profession => text().nullable()();
  TextColumn get education => text().nullable()();
  TextColumn get ministry => text().nullable()();
  DateTimeColumn get conversionDate => dateTime().nullable()();
  DateTimeColumn get baptismDate => dateTime().nullable()();
  TextColumn get temperament => text().nullable()();
  TextColumn get prayerFrequency => text().withDefault(const Constant('weekly'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
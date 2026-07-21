import 'package:drift/drift.dart';

class Groups extends Table {
  TextColumn get id => text()();
  TextColumn get workspaceId => text()();
  TextColumn get networkId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get leaderUserId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
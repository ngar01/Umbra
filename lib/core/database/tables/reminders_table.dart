import 'package:drift/drift.dart';

class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get memberId => text()();
  TextColumn get groupId => text()();
  TextColumn get type => text()(); // 'call' ou 'visit'
  DateTimeColumn get dueDate => dateTime()();
  BoolColumn get done => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
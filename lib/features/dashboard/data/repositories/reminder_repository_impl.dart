import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/reminder_entity.dart';
import '../../domain/repositories/reminder_repository.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final AppDatabase db;
  const ReminderRepositoryImpl(this.db);

  @override
  Stream<List<ReminderEntity>> watchPendingByType(String groupId, ReminderType type) {
    return (db.select(db.reminders)
      ..where((r) =>
      r.groupId.equals(groupId) &
      r.type.equals(type.name) &
      r.done.equals(false) &
      r.isDeleted.equals(false)))
        .watch()
        .map((rows) => rows
        .map((r) => ReminderEntity(
      id: r.id,
      memberId: r.memberId,
      groupId: r.groupId,
      type: type,
      dueDate: r.dueDate,
      done: r.done,
    ))
        .toList());
  }
}
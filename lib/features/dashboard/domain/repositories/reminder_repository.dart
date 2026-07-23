import '../entities/reminder_entity.dart';

abstract class ReminderRepository {
  Stream<List<ReminderEntity>> watchPendingByType(String groupId, ReminderType type);
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../data/repositories/reminder_repository_impl.dart';
import '../../domain/repositories/reminder_repository.dart';
import '../../domain/entities/reminder_entity.dart';

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  return ReminderRepositoryImpl(ref.watch(appDatabaseProvider));
});

final callRemindersProvider = StreamProvider.family<List<ReminderEntity>, String>((ref, groupId) {
  return ref.watch(reminderRepositoryProvider).watchPendingByType(groupId, ReminderType.call);
});

final visitRemindersProvider = StreamProvider.family<List<ReminderEntity>, String>((ref, groupId) {
  return ref.watch(reminderRepositoryProvider).watchPendingByType(groupId, ReminderType.visit);
});
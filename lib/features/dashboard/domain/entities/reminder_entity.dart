enum ReminderType { call, visit }

class ReminderEntity {
  final String id;
  final String memberId;
  final String groupId;
  final ReminderType type;
  final DateTime dueDate;
  final bool done;

  const ReminderEntity({
    required this.id,
    required this.memberId,
    required this.groupId,
    required this.type,
    required this.dueDate,
    this.done = false,
  });
}
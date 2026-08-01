enum GoalOwnerType { member, user }
enum GoalCategory { reading, prayer, fasting, service, visitation, other }
enum GoalSource { self, assigned }
enum GoalStatus { active, done, archived }

class GoalEntity {
  final String id;
  final GoalOwnerType ownerType;
  final String ownerId;
  final String title;
  final String? description;
  final GoalCategory category;
  final GoalSource source;
  final String? assignedByName;
  final String? assignedByUserId;
  final GoalStatus status;
  final DateTime? dueDate;
  final DateTime createdAt;

  const GoalEntity({
    required this.id,
    required this.ownerType,
    required this.ownerId,
    required this.title,
    this.description,
    this.category = GoalCategory.other,
    this.source = GoalSource.self,
    this.assignedByName,
    this.assignedByUserId,
    this.status = GoalStatus.active,
    this.dueDate,
    required this.createdAt,
  });

  GoalEntity copyWith({GoalStatus? status}) {
    return GoalEntity(
      id: id,
      ownerType: ownerType,
      ownerId: ownerId,
      title: title,
      description: description,
      category: category,
      source: source,
      assignedByName: assignedByName,
      assignedByUserId: assignedByUserId,
      status: status ?? this.status,
      dueDate: dueDate,
      createdAt: createdAt,
    );
  }
}
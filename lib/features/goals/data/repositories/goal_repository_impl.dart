import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/goal_entity.dart';
import '../../domain/repositories/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  final AppDatabase db;
  const GoalRepositoryImpl(this.db);

  @override
  Stream<List<GoalEntity>> watchByOwner(GoalOwnerType ownerType, String ownerId) {
    return (db.select(db.goals)
      ..where((g) =>
      g.ownerType.equals(ownerType.name) &
      g.ownerId.equals(ownerId) &
      g.isDeleted.equals(false)))
        .watch()
        .map((rows) => rows.map(_toEntity).toList());
  }

  @override
  Future<void> create(GoalEntity goal) async {
    await db.into(db.goals).insert(
      GoalsCompanion.insert(
        id: goal.id,
        ownerType: goal.ownerType.name,
        ownerId: goal.ownerId,
        title: goal.title,
        description: Value(goal.description),
        category: Value(goal.category.name),
        source: Value(goal.source.name),
        assignedByName: Value(goal.assignedByName),
        dueDate: Value(goal.dueDate),
      ),
    );
  }

  @override
  Future<void> markDone(String id) async {
    await (db.update(db.goals)..where((g) => g.id.equals(id)))
        .write(const GoalsCompanion(status: Value('done')));
  }

  GoalEntity _toEntity(Goal row) => GoalEntity(
    id: row.id,
    ownerType: GoalOwnerType.values.firstWhere((e) => e.name == row.ownerType),
    ownerId: row.ownerId,
    title: row.title,
    description: row.description,
    category: GoalCategory.values.firstWhere((e) => e.name == row.category,
        orElse: () => GoalCategory.other),
    source: GoalSource.values.firstWhere((e) => e.name == row.source,
        orElse: () => GoalSource.self),
    assignedByName: row.assignedByName,
    assignedByUserId: row.assignedByUserId,
    status: GoalStatus.values.firstWhere((e) => e.name == row.status,
        orElse: () => GoalStatus.active),
    dueDate: row.dueDate,
    createdAt: row.createdAt,
  );
}
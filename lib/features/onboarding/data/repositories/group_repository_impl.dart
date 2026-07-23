import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../members/domain/entities/group_entity.dart';
import '../../domain/repositories/group_repository.dart';

class GroupRepositoryImpl implements GroupRepository {
  final AppDatabase db;
  const GroupRepositoryImpl(this.db);

  @override
  Future<void> create(GroupEntity group) async {
    await db.into(db.groups).insert(
      GroupsCompanion.insert(
        id: group.id,
        workspaceId: group.workspaceId,
        networkId: Value(group.networkId),
        name: group.name,
        leaderUserId: Value(group.leaderUserId),
      ),
    );
  }

  @override
  Future<GroupEntity?> getById(String id) async {
    final row = await (db.select(db.groups)..where((g) => g.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return GroupEntity(
      id: row.id,
      workspaceId: row.workspaceId,
      networkId: row.networkId,
      name: row.name,
      leaderUserId: row.leaderUserId,
      createdAt: row.createdAt,
    );
  }
}
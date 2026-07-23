import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../members/domain/entities/workspace_entity.dart';
import '../../domain/repositories/workspace_repository.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  final AppDatabase db;
  const WorkspaceRepositoryImpl(this.db);

  @override
  Future<void> create(WorkspaceEntity workspace) async {
    await db.into(db.workspaces).insert(
      WorkspacesCompanion.insert(
        id: workspace.id,
        organizationId: Value(workspace.organizationId),
        name: workspace.name,
      ),
    );
  }

  @override
  Future<WorkspaceEntity?> getById(String id) async {
    final row = await (db.select(db.workspaces)..where((w) => w.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return WorkspaceEntity(
      id: row.id,
      organizationId: row.organizationId,
      name: row.name,
      createdAt: row.createdAt,
    );
  }
}
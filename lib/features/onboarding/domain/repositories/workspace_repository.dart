import '../../../members/domain/entities/workspace_entity.dart';

abstract class WorkspaceRepository {
  Future<void> create(WorkspaceEntity workspace);
  Future<WorkspaceEntity?> getById(String id);
}
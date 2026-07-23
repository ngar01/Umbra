import '../../../members/domain/entities/group_entity.dart';

abstract class GroupRepository {
  Future<void> create(GroupEntity group);
  Future<GroupEntity?> getById(String id);
}
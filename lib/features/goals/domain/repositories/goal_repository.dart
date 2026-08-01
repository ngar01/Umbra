import '../entities/goal_entity.dart';

abstract class GoalRepository {
  Stream<List<GoalEntity>> watchByOwner(GoalOwnerType ownerType, String ownerId);
  Future<void> create(GoalEntity goal);
  Future<void> markDone(String id);
}
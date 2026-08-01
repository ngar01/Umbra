import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../data/repositories/goal_repository_impl.dart';
import '../../domain/repositories/goal_repository.dart';
import '../../domain/entities/goal_entity.dart';

final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  return GoalRepositoryImpl(ref.watch(appDatabaseProvider));
});

// En V1, "user" = toi, identifié simplement par une constante locale
// (le vrai user_id arrivera avec l'auth Supabase en Phase 7)
const String currentUserId = 'local-leader';

final myGoalsProvider = StreamProvider<List<GoalEntity>>((ref) {
  return ref.watch(goalRepositoryProvider).watchByOwner(GoalOwnerType.user, currentUserId);
});
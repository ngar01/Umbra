import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../data/repositories/workspace_repository_impl.dart';
import '../../data/repositories/group_repository_impl.dart';
import '../../domain/repositories/workspace_repository.dart';
import '../../domain/repositories/group_repository.dart';

final workspaceRepositoryProvider = Provider<WorkspaceRepository>((ref) {
  return WorkspaceRepositoryImpl(ref.watch(appDatabaseProvider));
});

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  return GroupRepositoryImpl(ref.watch(appDatabaseProvider));
});
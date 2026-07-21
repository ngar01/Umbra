import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/permissions/current_permission_provider.dart';
import '../../data/repositories/member_repository_impl.dart';
import '../../domain/repositories/member_repository.dart';
import '../../domain/use_cases/get_members_use_case.dart';
import '../../domain/use_cases/create_member_use_case.dart';
import '../../domain/use_cases/search_members_use_case.dart';

final memberRepositoryProvider = Provider<MemberRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return MemberRepositoryImpl(db);
});

final getMembersUseCaseProvider = Provider<GetMembersUseCase>((ref) {
  return GetMembersUseCase(ref.watch(memberRepositoryProvider));
});

final createMemberUseCaseProvider = Provider<CreateMemberUseCase>((ref) {
  return CreateMemberUseCase(
    ref.watch(memberRepositoryProvider),
    ref.watch(permissionGuardProvider),
  );
});

final searchMembersUseCaseProvider = Provider<SearchMembersUseCase>((ref) {
  return SearchMembersUseCase(ref.watch(memberRepositoryProvider));
});
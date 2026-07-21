import '../../../../core/permissions/permission_guard.dart';
import '../../../../core/permissions/permission.dart';
import '../entities/member_entity.dart';
import '../repositories/member_repository.dart';

class CreateMemberUseCase {
  final MemberRepository repository;
  final PermissionGuard guard;

  const CreateMemberUseCase(this.repository, this.guard);

  Future<void> call(MemberEntity member) async {
    guard.ensure(Permission.writeMembers);
    await repository.create(member);
  }
}
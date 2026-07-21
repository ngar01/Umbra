import '../entities/member_entity.dart';
import '../repositories/member_repository.dart';

class GetMembersUseCase {
  final MemberRepository repository;
  const GetMembersUseCase(this.repository);

  Stream<List<MemberEntity>> call(String groupId) {
    return repository.watchAllByGroupStream(groupId);
  }
}
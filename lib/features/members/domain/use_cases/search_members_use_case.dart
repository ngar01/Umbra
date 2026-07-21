import '../entities/member_entity.dart';
import '../repositories/member_repository.dart';

class SearchMembersUseCase {
  final MemberRepository repository;
  const SearchMembersUseCase(this.repository);

  Future<List<MemberEntity>> call(String query, String groupId) {
    return repository.search(query, groupId);
  }
}
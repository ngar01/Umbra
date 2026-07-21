import '../entities/member_entity.dart';

abstract class MemberRepository {
  Future<List<MemberEntity>> watchAllByGroup(String groupId);
  Stream<List<MemberEntity>> watchAllByGroupStream(String groupId);
  Future<MemberEntity?> getById(String id);
  Future<void> create(MemberEntity member);
  Future<void> update(MemberEntity member);
  Future<void> delete(String id);
  Future<List<MemberEntity>> search(String query, String groupId);
}
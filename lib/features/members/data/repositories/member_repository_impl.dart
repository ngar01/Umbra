import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/member_entity.dart';
import '../../domain/repositories/member_repository.dart';
import '../mappers/member_mapper.dart';

class MemberRepositoryImpl implements MemberRepository {
  final AppDatabase db;
  const MemberRepositoryImpl(this.db);

  @override
  Future<List<MemberEntity>> watchAllByGroup(String groupId) async {
    final rows = await (db.select(db.members)
      ..where((m) => m.groupId.equals(groupId) & m.isDeleted.equals(false)))
        .get();
    return rows.map((r) => r.toEntity()).toList();
  }

  @override
  Stream<List<MemberEntity>> watchAllByGroupStream(String groupId) {
    return (db.select(db.members)
      ..where((m) => m.groupId.equals(groupId) & m.isDeleted.equals(false)))
        .watch()
        .map((rows) => rows.map((r) => r.toEntity()).toList());
  }

  @override
  Future<MemberEntity?> getById(String id) async {
    final row = await (db.select(db.members)..where((m) => m.id.equals(id)))
        .getSingleOrNull();
    return row?.toEntity();
  }

  @override
  Future<void> create(MemberEntity member) async {
    await db.into(db.members).insert(member.toCompanion());
  }

  @override
  Future<void> update(MemberEntity member) async {
    await (db.update(db.members)..where((m) => m.id.equals(member.id)))
        .write(member.toCompanion());
  }

  @override
  Future<void> delete(String id) async {
    // Soft delete — jamais de suppression physique, pour la sync CRDT-ready
    await (db.update(db.members)..where((m) => m.id.equals(id)))
        .write(const MembersCompanion(isDeleted: Value(true)));
  }

  @override
  Future<List<MemberEntity>> search(String query, String groupId) async {
    final rows = await (db.select(db.members)
      ..where((m) =>
      m.groupId.equals(groupId) &
      m.isDeleted.equals(false) &
      m.fullName.lower().contains(query.toLowerCase())))
        .get();
    return rows.map((r) => r.toEntity()).toList();
  }
}
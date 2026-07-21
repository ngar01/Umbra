import 'role.dart';

class MembershipEntity {
  final String id;
  final String userId;
  final String workspaceId;
  final String? groupId;
  final Role role;

  const MembershipEntity({
    required this.id,
    required this.userId,
    required this.workspaceId,
    this.groupId,
    required this.role,
  });
}
class GroupEntity {
  final String id;
  final String workspaceId;
  final String? networkId;
  final String name;
  final String? leaderUserId;
  final DateTime createdAt;

  const GroupEntity({
    required this.id,
    required this.workspaceId,
    this.networkId,
    required this.name,
    this.leaderUserId,
    required this.createdAt,
  });
}
class WorkspaceEntity {
  final String id;
  final String? organizationId;
  final String name;
  final DateTime createdAt;

  const WorkspaceEntity({
    required this.id,
    this.organizationId,
    required this.name,
    required this.createdAt,
  });
}
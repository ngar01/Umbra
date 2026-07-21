import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'role.dart';
import 'permission_guard.dart';

// En V1, un seul rôle actif : cellLeader.
// En V2, ce provider lira le Membership réel de l'utilisateur connecté.
final currentRoleProvider = Provider<Role>((ref) => Role.cellLeader);

final permissionGuardProvider = Provider<PermissionGuard>((ref) {
  final role = ref.watch(currentRoleProvider);
  return PermissionGuard(role);
});
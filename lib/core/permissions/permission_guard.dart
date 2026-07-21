import 'role.dart';
import 'permission.dart';

class PermissionGuard {
  final Role currentRole;

  const PermissionGuard(this.currentRole);

  bool can(Permission permission) {
    return rolePermissions[currentRole]?.contains(permission) ?? false;
  }

  void ensure(Permission permission) {
    if (!can(permission)) {
      throw PermissionDeniedException(permission, currentRole);
    }
  }
}

class PermissionDeniedException implements Exception {
  final Permission permission;
  final Role role;

  PermissionDeniedException(this.permission, this.role);

  @override
  String toString() =>
      'PermissionDeniedException: role $role cannot perform $permission';
}
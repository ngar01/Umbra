import 'package:flutter_riverpod/flutter_riverpod.dart';

// En V1, un seul groupe actif. En V2, ce provider deviendra sélectionnable
// (l'utilisateur pourra changer de groupe/workspace actif depuis un menu).
final currentGroupIdProvider = StateProvider<String?>((ref) => null);
final currentWorkspaceIdProvider = StateProvider<String?>((ref) => null);
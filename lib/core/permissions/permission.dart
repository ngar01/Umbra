import 'role.dart';

enum Permission {
  readMembers,
  writeMembers,
  deleteMembers,
  readJournal,
  writeJournal,
  readEvangelismPipeline,
  writeEvangelismPipeline,
  exportData,       // V2
  manageRoles,      // V2
}

const Map<Role, Set<Permission>> rolePermissions = {
  Role.owner: {
    Permission.readMembers,
    Permission.readJournal,
    Permission.readEvangelismPipeline,
    Permission.exportData,
    Permission.manageRoles,
  },
  Role.networkLeader: {
    Permission.readMembers,
    Permission.readJournal,
    Permission.readEvangelismPipeline,
    Permission.exportData,
  },
  Role.cellLeader: {
    Permission.readMembers,
    Permission.writeMembers,
    Permission.deleteMembers,
    Permission.readJournal,
    Permission.writeJournal,
    Permission.readEvangelismPipeline,
    Permission.writeEvangelismPipeline,
  },
  Role.assistant: {
    Permission.readMembers,
    Permission.readJournal,
    Permission.writeJournal,
    Permission.readEvangelismPipeline,
  },
  Role.member: {
    // V3 — accès à son propre profil uniquement, géré séparément
  },
};
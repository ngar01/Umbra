import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'tables/workspaces_table.dart';
import 'tables/groups_table.dart';
import 'tables/members_table.dart';
import 'tables/reminders_table.dart';
import 'tables/goals_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Workspaces, Groups, Members, Reminders, Goals])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(reminders);
      }
      if (from < 3) {
        await m.createTable(goals);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'umbra.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
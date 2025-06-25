import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart';
import 'package:start/core/database/database.drift.dart';
import 'package:start/core/env.dart';
import 'package:start/modules/todos/tables/todos_table.dart';
import 'package:start/shared/database/timestamps_mixin.dart';

@DriftDatabase(tables: [TodosTable])
class Database extends $Database {
  @override
  int schemaVersion = 1;

  Database([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  late MigrationStrategy migration = MigrationStrategy(
    onCreate: (m) async {
      await customStatement(getUpdateAtTriggerFn());

      await m.createAll();
      await customStatement(TodosTable().generateUpdateAtTrigger());
      // Add any other tables' triggers here
    },
  );

  static QueryExecutor _openConnection() {
    final Uri(
      :host,
      :userInfo,
      :port,
      :pathSegments,
      :queryParameters,
    ) = Uri.parse(Env.databaseUrl);
    final [username, password] = userInfo.split(':');
    final sslModeString = queryParameters['sslmode'] ?? 'disable';

    return PgDatabase(
      endpoint: Endpoint(
        host: host,
        database: pathSegments.last,
        username: username,
        password: password,
        port: port,
      ),
      settings: ConnectionSettings(
        sslMode: SslMode.values.byName(sslModeString),
      ),
    );
  }
}

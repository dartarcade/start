import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

mixin PrimaryKeyMixin on Table {
  late final id = customType(PgTypes.uuid)
      .withDefault(const FunctionCallExpression('gen_random_uuid', []))();

  @override
  Set<Column> get primaryKey => {id};
}

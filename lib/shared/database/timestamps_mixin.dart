import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:meta/meta.dart';

mixin TimestampsMixin on Table {
  // We mark `tableName` as `@mustBeOverridden` to ensure that subclasses
  // override it.
  @override
  @mustBeOverridden
  String get tableName;

  late final createdAt = customType(PgTypes.timestampWithTimezone)
      .withDefault(const FunctionCallExpression('now', []))();

  late final updatedAt = customType(PgTypes.timestampWithTimezone)
      .withDefault(const FunctionCallExpression('now', []))();

  String generateUpdateAtTrigger() {
    return '''
CREATE TRIGGER ${tableName}_updated_at_trigger
BEFORE UPDATE ON $tableName
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
''';
  }
}

String getUpdateAtTriggerFn() {
  return r'''
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';
''';
}

import 'package:drift/drift.dart';
import 'package:start/shared/database/primary_key_mixin.dart';
import 'package:start/shared/database/timestamps_mixin.dart';

class TodosTable extends Table with PrimaryKeyMixin, TimestampsMixin {
  @override
  String get tableName => 'todos';

  late final title = text().withLength(min: 1, max: 255)();

  late final description = text().withLength(min: 1, max: 1000)();

  late final completed = boolean().withDefault(const Constant(false))();
}

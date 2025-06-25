// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:start/core/database/database.dart' as i1;
import 'package:start/modules/todos/tables/todos_table.drift.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;

mixin $TodoRepositoryMixin on i0.DatabaseAccessor<i1.Database> {
  i2.$TodosTableTable get todosTable =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.$TodosTableTable>('todos');
}

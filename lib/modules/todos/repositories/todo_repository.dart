import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:start/core/database/database.dart';
import 'package:start/modules/todos/repositories/todo_repository.drift.dart';
import 'package:start/modules/todos/tables/todos_table.dart';
import 'package:start/modules/todos/tables/todos_table.drift.dart';

@singleton
@DriftAccessor(tables: [TodosTable])
class TodoRepository extends DatabaseAccessor<Database>
    with $TodoRepositoryMixin {
  TodoRepository(super.attachedDatabase);

  Future<List<TodosTableData>> getTodos() {
    return todosTable.select().get();
  }

  Future<TodosTableData> createTodo(TodosTableCompanion todo) {
    return todosTable.insertReturning(todo);
  }

  Future<void> updateTodo(TodosTableCompanion todo) async {
    await (todosTable.update()..whereSamePrimaryKey(todo)).write(todo);
  }

  Future<void> deleteTodo(TodosTableCompanion todo) async {
    await (todosTable.delete()..whereSamePrimaryKey(todo)).go();
  }
}

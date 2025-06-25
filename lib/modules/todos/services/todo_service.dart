import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:injectable/injectable.dart';
import 'package:start/modules/todos/data/create_todo_request.dart';
import 'package:start/modules/todos/repositories/todo_repository.dart';
import 'package:start/modules/todos/tables/todos_table.drift.dart';

@singleton
class TodoService {
  final TodoRepository _todoRepository;

  TodoService(this._todoRepository);

  Future<List<TodosTableData>> getTodos() {
    return _todoRepository.getTodos();
  }

  Future<TodosTableData> createTodo(CreateTodoRequest request) {
    return _todoRepository.createTodo(
      TodosTableCompanion.insert(
        title: request.title,
        description: request.description,
      ),
    );
  }

  Future<void> markAsDone(String id) {
    return _todoRepository.updateTodo(
      TodosTableCompanion(
        id: Value(UuidValue.fromString(id)),
        completed: const Value(true),
      ),
    );
  }

  Future<void> markAsNotDone(String id) {
    return _todoRepository.updateTodo(
      TodosTableCompanion(
        id: Value(UuidValue.fromString(id)),
        completed: const Value(false),
      ),
    );
  }

  Future<void> deleteTodo(String id) {
    return _todoRepository.deleteTodo(
      TodosTableCompanion(
        id: Value(UuidValue.fromString(id)),
      ),
    );
  }
}

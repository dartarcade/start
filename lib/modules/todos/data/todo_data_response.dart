import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luthor/luthor.dart';
import 'package:start/modules/todos/tables/todos_table.drift.dart';
import 'package:superclass/superclass.dart';

part 'todo_data_response.freezed.dart';
part 'todo_data_response.g.dart';
part 'todo_data_response.superclass.dart';

@Superclass(
  includeJsonSerialization: true,
  classAnnotations: [Luthor()],
  apply: [Merge<TodosTableData, _TodosTableData>()],
)
typedef TodoDataResponse = $TodoDataResponse;

class _TodosTableData {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  _TodosTableData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
}

extension TodosDataResponseExtension on TodosTableData {
  TodoDataResponse get toTodoDataResponse {
    return TodoDataResponse(
      id: id.uuid,
      title: title,
      description: description,
      completed: completed,
      createdAt: createdAt.dateTime,
      updatedAt: updatedAt.dateTime,
    );
  }
}

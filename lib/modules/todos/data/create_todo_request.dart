import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luthor/luthor.dart';

part 'create_todo_request.freezed.dart';
part 'create_todo_request.g.dart';

@luthor
@freezed
abstract class CreateTodoRequest with _$CreateTodoRequest {
  const factory CreateTodoRequest({
    @HasMin(1) @HasMax(255) required String title,
    @HasMin(1) @HasMax(1000) required String description,
  }) = _CreateTodoRequest;

  factory CreateTodoRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoRequestFromJson(json);
}

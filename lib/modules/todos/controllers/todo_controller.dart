import 'dart:async';

import 'package:arcade/arcade.dart';
import 'package:arcade_swagger/arcade_swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:luthor/luthor.dart';
import 'package:start/modules/todos/data/create_todo_request.dart';
import 'package:start/modules/todos/data/todo_data_response.dart';
import 'package:start/modules/todos/services/todo_service.dart';
import 'package:start/shared/data/success_response.dart';
import 'package:start/shared/extensions/luthor_extension.dart';

@singleton
class TodoController {
  final TodoService todoService;

  TodoController(this.todoService) {
    route.group<RequestContext>(
      '/todos',
      defineRoutes: (route) {
        route()
            .swagger(
              tags: ['Todos'],
              summary: 'Get all todos',
              description: 'Get all todos',
              responses: {
                '200': l.list(validators: [$$TodoDataResponseSchema]),
              },
            )
            .get('/')
            .handle(getTodos);
        route()
            .swagger(
              tags: ['Todos'],
              summary: 'Create a todo',
              description: 'Create a todo',
              request: $CreateTodoRequestSchema,
              responses: {
                '201': $$TodoDataResponseSchema,
              },
            )
            .post('/')
            .handle(createTodo);
        route()
            .swagger(
              tags: ['Todos'],
              summary: 'Mark a todo as done',
              description: 'Mark a todo as done',
              parameters: const [
                Parameter.path(
                  name: 'id',
                  description: 'The id of the todo',
                ),
              ],
            )
            .put('/:id/complete')
            .handle(markAsDone);
        route()
            .swagger(
              tags: ['Todos'],
              summary: 'Mark a todo as not done',
              description: 'Mark a todo as not done',
              parameters: const [
                Parameter.path(
                  name: 'id',
                  description: 'The id of the todo',
                ),
              ],
            )
            .put('/:id/incomplete')
            .handle(markAsNotDone);
        route()
            .swagger(
              tags: ['Todos'],
              summary: 'Delete a todo',
              description: 'Delete a todo',
              parameters: const [
                Parameter.path(
                  name: 'id',
                  description: 'The id of the todo',
                ),
              ],
            )
            .delete('/:id')
            .handle(deleteTodo);
      },
    );
  }

  Future<List<TodoDataResponse>> getTodos(RequestContext context) {
    return todoService
        .getTodos()
        .then((todos) => todos.map((todo) => todo.toTodoDataResponse).toList());
  }

  Future<TodoDataResponse> createTodo(RequestContext context) async {
    context.statusCode = 201;
    final request = await $CreateTodoRequestValidate.withContext(context);
    return todoService
        .createTodo(request)
        .then((todo) => todo.toTodoDataResponse);
  }

  Future<SuccessResponse> markAsDone(RequestContext context) async {
    final id = context.pathParameters['id']!;
    await todoService.markAsDone(id);
    return const SuccessResponse(message: 'Todo marked as done');
  }

  Future<SuccessResponse> markAsNotDone(RequestContext context) async {
    final id = context.pathParameters['id']!;
    await todoService.markAsNotDone(id);
    return const SuccessResponse(message: 'Todo marked as not done');
  }

  Future<SuccessResponse> deleteTodo(RequestContext context) async {
    final id = context.pathParameters['id']!;
    await todoService.deleteTodo(id);
    return const SuccessResponse(message: 'Todo deleted');
  }
}

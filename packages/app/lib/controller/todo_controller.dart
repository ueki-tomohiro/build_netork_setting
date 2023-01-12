import 'package:app/repository/todo_repository.dart';
import 'package:app/state/todo_state.dart';
import 'package:external_todo/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_controller.g.dart';

@riverpod
Future<TodoState> todoController(TodoControllerRef ref, int todoId) async {
  final ITodoRepository repository = ref.read(todoRepositoryProvider);
  final todo = await repository.getTodo(todoId);

  try {
    if (todo != null) {
      return TodoState.loaded(todo: todo);
    } else {
      return TodoState.failure();
    }
  } catch (error, trace) {
    return TodoState.failure(error: error, trace: trace);
  }
}

@riverpod
Future<List<Todo>> todoListController(TodoListControllerRef ref) async {
  final ITodoRepository repository = ref.read(todoRepositoryProvider);
  return await repository.getTodos() ?? [];
}

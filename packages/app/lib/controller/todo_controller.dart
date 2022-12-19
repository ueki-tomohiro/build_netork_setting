import 'package:app/repository/todo_repository.dart';
import 'package:app/state/todo_state.dart';
import 'package:external_todo/api.dart';
import 'package:riverpod/riverpod.dart';

final todoControllerProvider =
    FutureProvider.family.autoDispose<TodoState, int>((ref, todoId) async {
  final repository = ref.watch(todoRepositoryProvider);
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
});

final todoListControllerProvider =
    FutureProvider.autoDispose<List<Todo>>((ref) async {
  final repository = ref.watch(todoRepositoryProvider);
  return await repository.getTodos() ?? [];
});

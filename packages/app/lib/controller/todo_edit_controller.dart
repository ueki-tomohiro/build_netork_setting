import 'package:app/repository/todo_repository.dart';
import 'package:app/state/todo_state.dart';
import 'package:riverpod/riverpod.dart';

class TodoEditController extends StateNotifier<AsyncValue<TodoState>> {
  final ITodoRepository repository;
  final int? todoId;
  TodoEditController(this.repository, this.todoId)
      : super(AsyncData(TodoState.undefined()));

  Future<void> registerTodo(String description, DateTime endDate) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      final todo = await repository.registerTodo(description, endDate);
      if (todo != null) {
        return TodoState.updated(todo: todo);
      } else {
        return TodoState.failure();
      }
    });
  }

  Future<void> updateTodo(
      String description, DateTime endDate, bool completed) async {
    final todoId = this.todoId;
    if (todoId == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      final todo =
          await repository.updateTodo(todoId, description, endDate, completed);
      if (todo != null) {
        return TodoState.updated(todo: todo);
      } else {
        return TodoState.failure();
      }
    });
  }

  Future<void> deleteTodo() async {
    final todoId = this.todoId;
    if (todoId == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      await repository.deleteTodo(todoId);
      return TodoState.deleted();
    });
  }

  Future<void> getTodo() async {
    final todoId = this.todoId;
    if (todoId == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      final todo = await repository.getTodo(todoId);
      if (todo != null) {
        return TodoState.loaded(todo: todo);
      } else {
        return TodoState.failure();
      }
    });
  }
}

final todoEditControllerProvider = StateNotifierProvider.family
    .autoDispose<TodoEditController, AsyncValue<TodoState>, int?>(
        (ref, todoId) {
  final repository = ref.read(todoRepositoryProvider);
  return TodoEditController(repository, todoId);
});

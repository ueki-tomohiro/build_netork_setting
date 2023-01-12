import 'package:app/repository/todo_repository.dart';
import 'package:app/state/todo_state.dart';
import 'package:riverpod/riverpod.dart';

class TodoEditController
    extends AutoDisposeFamilyAsyncNotifier<TodoState, int?> {
  late final int? _todoId;

  @override
  TodoState build(int? todoId) {
    _todoId = todoId;
    return TodoState.undefined();
  }

  Future<void> registerTodo(String description, DateTime endDate) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      final ITodoRepository repository = ref.read(todoRepositoryProvider);
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
    final todoId = _todoId;
    if (todoId == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      final ITodoRepository repository = ref.read(todoRepositoryProvider);
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
    final todoId = _todoId;
    if (todoId == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      final ITodoRepository repository = ref.read(todoRepositoryProvider);
      await repository.deleteTodo(todoId);
      return TodoState.deleted();
    });
  }

  Future<void> getTodo() async {
    final todoId = _todoId;
    if (todoId == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard<TodoState>(() async {
      final ITodoRepository repository = ref.read(todoRepositoryProvider);
      final todo = await repository.getTodo(todoId);
      if (todo != null) {
        return TodoState.loaded(todo: todo);
      } else {
        return TodoState.failure();
      }
    });
  }
}

final todoEditControllerProvider = AsyncNotifierProvider.autoDispose
    .family<TodoEditController, TodoState, int?>(TodoEditController.new);

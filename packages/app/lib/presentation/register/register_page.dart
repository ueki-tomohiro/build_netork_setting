import 'package:app/controller/todo_controller.dart';
import 'package:app/controller/todo_edit_controller.dart';
import 'package:app/presentation/register/register.dart';
import 'package:app/state/todo_state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editState = ref.watch(todoEditControllerProvider(null));

    useEffect(() {
      if (editState is TodoStateUpdated) {
        Future.microtask(() {
          ref.invalidate(todoListControllerProvider);
          context.pop();
        });
      }
      return null;
    }, []);

    return Register(
      registerTodo: (description, endDate) {
        ref
            .read(todoEditControllerProvider(null).notifier)
            .registerTodo(description, endDate);
      },
    );
  }
}

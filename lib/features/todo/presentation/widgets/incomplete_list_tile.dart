import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncompleteListTile extends StatelessWidget {
  const IncompleteListTile({
    required this.todo,
    super.key,
  });

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppContainer(
      height: Dimens.dp45,
      width: Dimens.dp342,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCheckbox(
            value: todo.isCompleted ?? false,
            size: Dimens.dp24,
            checkedColor: Colors.white,
            uncheckedColor: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: theme.colorScheme.onSurface,
            ),
            checkedWidget: Icon(
              Icons.check,
              color: theme.colorScheme.onPrimary,
              size: Dimens.dp14,
            ),
            onChanged: (bool? value) {
              context.read<TodoBloc>().add(
                    ToggleTodoEvent(todoEntity: todo),
                  );
            },
          ),
          const AppContainer(
            width: Dimens.dp16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.todoName?.isEmpty  ?? true ? '..' : todo.todoName!,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.inversePrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              AppText(
                data:
                    '''${todo.categoryId?.isEmpty ?? true ? 'No Category' : todo.categoryId}''',
                fontSize: Dimens.dp12,
                fontWeight: FontWeight.w400,
                // color: AppColorsData.light().black70,
              ),
            ],
          )
        ],
      ),
    );
  }
}

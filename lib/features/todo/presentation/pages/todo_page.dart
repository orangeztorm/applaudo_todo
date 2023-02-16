import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:applaudo_todo/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    context.read<AuthBloc>().add(const Login());
    return BlocProvider(
      create: (context) => getIt<TodoBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
            child: _TodoPageView(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/addTodoPage');
          },
          backgroundColor: theme.primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _TodoPageView extends StatelessWidget {
  // ignore: unused_element
  const _TodoPageView({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<TodoBloc>().add(const GetTodoEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ActiveInactiveTodoCountCubit>(
          create: (_) => ActiveInactiveTodoCountCubit(
            activeTodoCount: context
                .read<TodoBloc>()
                .state
                .todos
                .where((task) => (task.isCompleted ?? false) == true)
                .length,
            inactiveTodoCount: context
                .read<TodoBloc>()
                .state
                .todos
                .where((task) => task.isCompleted == false)
                .length,
          ),
        ),
        BlocProvider<ActiveInactiveTodoCubit>(
          create: (context) => ActiveInactiveTodoCubit(
            activeTodo: context
                .read<TodoBloc>()
                .state
                .todos
                .where((task) => (task.isCompleted ?? false) == true)
                .toList(),
            inActiveTodo: context
                .read<TodoBloc>()
                .state
                .todos
                .where((task) => task.isCompleted == false)
                .toList(),
          ),
        ),
      ],
      child: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state.status == TodoStatus.success) {
            final activeTodoCount = state.todos
                .where((task) => (task.isCompleted ?? false) == true);
            final inactiveTodoCount =
                state.todos.where((task) => task.isCompleted == false);
            context
                .read<ActiveInactiveTodoCountCubit>()
                .calculateActiveInactiveTodoCount(
                  activeTodoCount: activeTodoCount.length,
                  inactiveTodoCount: inactiveTodoCount.length,
                );
            context.read<ActiveInactiveTodoCubit>().calculateActiveInactiveTodo(
                  activeTodo: activeTodoCount.toList(),
                  inActiveTodo: inactiveTodoCount.toList(),
                );
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage ?? 'error',
                  ),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state.status == TodoStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == TodoStatus.failure) {
            return Column(
              children: [
                Center(
                  child: Text('${state.errorMessage}'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
              ],
            );
          }
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const _TodoPageHeader(),
              const _TodoPageBody(),
            ],
          );
        },
      ),
    );
  }
}

class _TodoPageHeader extends StatelessWidget {
  const _TodoPageHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppContainer(
      height: Dimens.dp82,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppContainer(
                    height: Dimens.dp39,
                    width: Dimens.dp227,
                    child: FittedBox(
                      child: Text(
                        formatDate(DateTime.now()),
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: theme.colorScheme.onSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Dimens.dp14,
                  ),
                  const AppContainer(
                    width: Dimens.dp14,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: Dimens.dp24,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Dimens.dp8,
              ),
              BlocListener<TodoBloc, TodoState>(
                listener: (context, state) {},
                child: BlocBuilder<ActiveInactiveTodoCountCubit,
                    ActiveInactiveTodoCountState>(
                  builder: (context, state) {
                    return Text(
                      '''${state.inactiveTodoCount} incomplete, ${state.activeTodoCount} completed''',
                      style: theme.textTheme.bodyLarge?.copyWith(),
                    );
                  },
                ),
              ),
            ],
          ),
          const AppContainer(
            width: Dimens.dp14,
          ),
          const Spacer(),
          const AppContainer(
            width: Dimens.dp48,
            height: Dimens.dp48,
            child: AppPng(
              asset: MainAssets.userIconPng,
              width: Dimens.dp48,
              height: Dimens.dp48,
            ),
          )
        ],
      ),
    );
  }
}

class _TodoPageBody extends StatelessWidget {
  const _TodoPageBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        AppContainer(
          height: Dimens.dp730,
          child: ListView(
            shrinkWrap: true,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const _IncompleteTodoWidget(),
              const _CompleteTodoWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

class _IncompleteTodoWidget extends StatelessWidget {
  // ignore: unused_element
  const _IncompleteTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inCompletedTask =
        context.watch<ActiveInactiveTodoCubit>().state.inActiveTodo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Incomplete',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.inversePrimary,
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dp18,
          ),
        ),
        const SizedBox(
          height: Dimens.dp16,
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: Dimens.dp16,
            );
          },
          itemBuilder: (context, index) => IncompleteListTile(
            todo: inCompletedTask[index],
          ),
          itemCount: inCompletedTask.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

class _CompleteTodoWidget extends StatelessWidget {
  // ignore: unused_element
  const _CompleteTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final completedTask =
        context.watch<ActiveInactiveTodoCubit>().state.activeTodo;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Dimens.dp16,
        ),
        Text(
          'Completed',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.inversePrimary,
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dp18,
          ),
        ),
        const SizedBox(
          height: Dimens.dp16,
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: Dimens.dp16,
            );
          },
          itemCount: completedTask.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CompletedListTile(
            todo: completedTask[index],
          ),
        ),
      ],
    );
  }
}

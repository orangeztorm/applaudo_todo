// ignore_for_file: unnecessary_const

import 'dart:io';

import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:applaudo_todo/locator.dart';
import 'package:applaudo_todo/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NewTodoCubit(),
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => getIt<CategoryBloc>()
            ..add(
              CategoryLoadEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => getIt<AddTodoBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: theme.primaryColor,
          ),
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'To go back',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.dp16,
            ),
            child: Column(
              children: const [
                const SizedBox(
                  height: Dimens.dp24,
                ),
                const AddTodoHeaderText(),
                const Divider(),
                const SizedBox(
                  height: Dimens.dp14,
                ),
                const TitleTextField(),
                const SizedBox(
                  height: Dimens.dp14,
                ),
                const CategoryTextField(),
                const SizedBox(
                  height: Dimens.dp14,
                ),
                const DateTextField(),
                const SizedBox(
                  height: Dimens.dp16,
                ),
                const AddPageButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddTodoHeaderText extends StatelessWidget {
  const AddTodoHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppContainer(
      height: Dimens.dp42,
      width: double.infinity,
      child: Text(
        'New Task',
        style: theme.textTheme.headlineLarge?.copyWith(
          color: theme.colorScheme.onSecondary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<NewTodoCubit>(),
      builder: (BuildContext context, AddTodoFormState state) {
        final controller = TextEditingController(
          text: state.title.value,
        );
        // make the textfield cursor always infrontof the text
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
        return AppTextField(
          hintText: 'Title',
          controller: controller,
          onChanged: (String? value) {
            context.read<NewTodoCubit>().onTitleChange(value ?? '');
          },
        );
      },
    );
  }
}

class CategoryTextField extends StatelessWidget {
  const CategoryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocBuilder(
      bloc: context.read<NewTodoCubit>(),
      builder: (BuildContext context, AddTodoFormState state) {
        controller
          ..text = state.category?.name ?? ''
          // make the textfield cursor always infrontof the text
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        return PlatformDropdown<CategoryEntity?>(
          options: context.watch<CategoryBloc>().state.categories,
          selectedValue: context.watch<NewTodoCubit>().state.category,
          onChanged: (category) {
            if (category != null) {
              context.read<NewTodoCubit>().onCategoryChange(category);
            }
          },
          itemBuilder: _buildDropdownMenuItem,
        );
      },
    );
  }

  DropdownMenuItem<CategoryEntity?> _buildDropdownMenuItem(
    CategoryEntity? category,
  ) {
    return DropdownMenuItem<CategoryEntity>(
      value: category,
      child: Text(category?.categoryName ?? ''),
    );
  }
}

class DateTextField extends StatelessWidget {
  const DateTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<NewTodoCubit>(),
      builder: (BuildContext context, AddTodoFormState state) {
        final dateTextController = TextEditingController(
          text: state.date.value,
        );
        return AppContainer(
          height: Dimens.dp56,
          child: AppTextField(
            controller: dateTextController,
            hintText: 'When?',
            suffixIcon: GestureDetector(
              onTap: () {
                if (Platform.isIOS) {
                  _showIosDatePicker(context);
                } else {
                  _showAndroidDatePicker(context);
                }
              },
              child: const AppContainer(
                height: Dimens.dp20,
                width: Dimens.dp18,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Center(
                    child: AppPng(
                      asset: MainAssets.calenderIconPng,
                      height: Dimens.dp20,
                      width: Dimens.dp18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showIosDatePicker(
    BuildContext context,
  ) {
    // ignore: inference_failure_on_function_invocation
    showCupertinoModalPopup(
      context: context,
      builder: (builderContext) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now().add(
              const Duration(
                days: 1,
              ),
            ),
            minimumDate: DateTime.now(),
            onDateTimeChanged: (date) {
              context.read<NewTodoCubit>().onDateChange(date.toString());
            },
          ),
        );
      },
    );
  }

  void _showAndroidDatePicker(BuildContext context) {
    // ignore: inference_failure_on_function_invocation
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: Dimens.dp300,
            width: Dimens.dp300,
            child: SfDateRangePicker(
              minDate: DateTime.now(),
              maxDate: DateTime.now().add(
                const Duration(days: 365),
              ),
              headerHeight: Dimens.dp14,
              onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                context.read<NewTodoCubit>().onDateChange(
                      dateRangePickerSelectionChangedArgs.toString(),
                    );
              },
            ),
          ),
        );
      },
    );
  }
}

class AddPageButton extends StatelessWidget {
  const AddPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: Dimens.dp44,
      width: Dimens.dp96,
      child: BlocConsumer<AddTodoBloc, AddTodoState>(
        bloc: context.read<AddTodoBloc>(),
        listener: (context, state) {
          if (state.status == AddTodoStatus.success) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return PlatformAlertDialog(
                  title: state.sucessMessage,
                  message: 'Move To HomePage',
                  positiveText: 'Yes',
                  negativeText: '',
                  onPositivePressed: () {
                    // Perform delete action
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteGenerator.home,
                      (route) => false,
                    );
                  },
                );
              },
            );
          } else if (state.status == AddTodoStatus.failure) {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return PlatformAlertDialog(
                  title: 'Error',
                  message: state.errorMessage,
                  positiveText: 'Retry',
                  negativeText: 'Close',
                  onPositivePressed: () {
                    // Perform delete action
                    context.read<AddTodoBloc>().add(
                          AddTodo(
                            category: context
                                    .read<NewTodoCubit>()
                                    .state
                                    .category
                                    ?.name ??
                                '',
                            date: dateTimeToUnix(
                              context.read<NewTodoCubit>().state.date.value,
                            ).toString(),
                            title:
                                context.read<NewTodoCubit>().state.title.value,
                          ),
                        );
                  },
                  onNegativePressed: () => Navigator.of(context).pop(),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state.status == AddTodoStatus.submitting) {
            return const AppContainer(
              width: Dimens.dp30,
              height: Dimens.dp30,
              child: CircularProgressIndicator(),
            );
          }
          return ElevatedButton(
            onPressed: () {
              context.read<AddTodoBloc>().add(
                    AddTodo(
                      category:
                          context.read<NewTodoCubit>().state.category?.name ??
                              '',
                      date: dateTimeToUnix(
                        context.read<NewTodoCubit>().state.date.value,
                      ).toString(),
                      title: context.read<NewTodoCubit>().state.title.value,
                    ),
                  );
            },
            child: const AppText(
              data: 'Add',
              color: Colors.white,
              fontSize: Dimens.dp16,
              fontWeight: FontWeight.w600,
            ),
          );
        },
      ),
    );
  }
}

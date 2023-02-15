// ignore: lines_longer_than_80_chars
// ignore_for_file: no_leading_underscores_for_local_identifiers, omit_local_variable_types, prefer_final_locals, use_super_parameters

part of 'new_todo_cubit.dart';

class AddTodoFormState extends Formz {
  AddTodoFormState({
    this.title = const RequiredValue.dirty(),
    this.date = const RequiredValue.dirty(),
    this.category,
    this.status = FormzStatus.invalid,
  });

  final RequiredValue title;
  final RequiredValue date;
  final CategoryEntity? category;
  final FormzStatus status;

  AddTodoFormState copyWith({
    RequiredValue? title,
    RequiredValue? date,
    CategoryEntity? category,
  }) {
    RequiredValue _title = title ?? this.title;
    RequiredValue _date = date ?? this.date;
    CategoryEntity? _category = category ?? this.category;

    FormzStatus? _status;

    if (_title.valid && _date.valid && _category?.name != null) {
      _status = FormzStatus.valid;
    } else {
      _status = FormzStatus.invalid;
    }

    return AddTodoFormState(
      title: _title,
      date: _date,
      category: _category,
      status: _status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title.value,
      'date': date.value,
      'category': category,
    };
  }
}

enum RequiredValueValidationError { invalid }

class RequiredValue extends FormzInput<String, RequiredValueValidationError> {
  const RequiredValue.pure([String value = '']) : super.pure(value);

  const RequiredValue.dirty([String value = '']) : super.dirty(value);

  @override
  RequiredValueValidationError? validator(String value) {
    return value.isNotEmpty ? null : RequiredValueValidationError.invalid;
  }
}

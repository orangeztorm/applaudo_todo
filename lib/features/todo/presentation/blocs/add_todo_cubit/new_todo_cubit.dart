import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

part 'new_todo_state.dart';

class NewTodoCubit extends Cubit<AddTodoState> {
  NewTodoCubit() : super(AddTodoState());

  void onCategoryChange(CategoryEntity category) {
    emit(state.copyWith(category: category));
  }

  void onDateChange(String date) {
    emit(state.copyWith(date: RequiredValue.dirty(date)));
  }

  void onTitleChange(String? title) {
    if (title == null) return;

    emit(state.copyWith(title: RequiredValue.dirty(title)));
  }
}

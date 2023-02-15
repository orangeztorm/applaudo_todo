import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/features/todo/todo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    required this.getCategoriesUseCase,
  }) : super(CategoryState.initial()) {
    on<CategoryLoadEvent>(_loadCategories);
  }

  Future<void> _loadCategories(
    CategoryLoadEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    final result = await getCategoriesUseCase(const NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CategoryStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (categories) => emit(
        state.copyWith(
          status: CategoryStatus.success,
          categories: categories,
        ),
      ),
    );
  }

  final GetCategoriesUseCase getCategoriesUseCase;
}

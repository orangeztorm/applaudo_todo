// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'category_bloc.dart';

enum CategoryStatus {
  initial,
  loading,
  failure,
  success,
}

class CategoryState extends Equatable {
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.categories = const <CategoryEntity>[],
    this.errorMessage = '',
  });

  final CategoryStatus status;
  final List<CategoryEntity> categories;
  final String errorMessage;

  factory CategoryState.initial() => const CategoryState();

  CategoryState copyWith({
    CategoryStatus? status,
    List<CategoryEntity>? categories,
    String? errorMessage,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, categories, errorMessage];

  @override
  String toString() {
    return '''CategoryState { status: $status, categories: $categories, errorMessage: $errorMessage }''';
  }
}

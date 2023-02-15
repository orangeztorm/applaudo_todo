// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'active_inactive_todo_count_cubit.dart';

class ActiveInactiveTodoCountState extends Equatable {
  final int activeTodoCount;
  final int inactiveTodoCount;

  const ActiveInactiveTodoCountState({
    required this.activeTodoCount,
    required this.inactiveTodoCount,
  });

  @override
  List<Object> get props => [activeTodoCount, inactiveTodoCount,];

  ActiveInactiveTodoCountState copyWith({
    int? activeTodoCount,
    int? inactiveTodoCount,
  }) {
    return ActiveInactiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
      inactiveTodoCount: inactiveTodoCount ?? this.inactiveTodoCount,
    );
  }

  @override
  String toString() =>
      '''ActiveInactiveTodoCountState { activeTodoCount: $activeTodoCount, inactiveTodoCount: $inactiveTodoCount}''';

  factory ActiveInactiveTodoCountState.initial() {
    return const ActiveInactiveTodoCountState(
      activeTodoCount: 0,
      inactiveTodoCount: 0,
    );
  }
}

part of 'to_do_bloc.dart';

@immutable
abstract class ToDoEvent {}

class AddToDoEvent extends ToDoEvent {
  final String toDo;

  AddToDoEvent({required this.toDo});
  List<Object> get props => [toDo];
}

class DeleteToDoEvent extends ToDoEvent {
  final String toDo;

  DeleteToDoEvent({required this.toDo});
  List<Object> get props => [toDo];
}

class CompleteToDoEvent extends ToDoEvent {
  final String toDo;

  CompleteToDoEvent({required this.toDo});
  List<Object> get props => [toDo];
}

class GetToDosEvent extends ToDoEvent {}

// Sépala si el siguiente

class GetCompletedToDosEvent extends ToDoEvent {}

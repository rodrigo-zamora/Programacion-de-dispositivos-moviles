part of 'to_do_bloc.dart';

@immutable
abstract class ToDoState {
  get toDoList => null;
}

class ToDoInitial extends ToDoState {}

class ErrorState extends ToDoState {
  final String error;

  ErrorState({required this.error});
}

class LoadedToDoState extends ToDoState {
  final List<String> toDos;

  LoadedToDoState({required this.toDos});
  List<Object> get props => [toDos];
}

class LoadedCompletedToDoState extends ToDoState {
  final List<String> completeToDos;

  LoadedCompletedToDoState({required this.completeToDos});

  List<Object> get props => [completeToDos];
}

class AddToDoSuccessState extends ToDoState {}

class AddToDoErrorState extends ToDoState {
  final String errorMsg;

  AddToDoErrorState({required this.errorMsg});

  List<Object> get props => [errorMsg];
}

class DeleteToDoSuccessState extends ToDoState {}

class DeleteToDoErrorState extends ToDoState {
  final String errorMsg;

  DeleteToDoErrorState({required this.errorMsg});

  List<Object> get props => [errorMsg];
}

class GetToDosSuccessState extends ToDoState {}

class GetToDosErrorState extends ToDoState {
  final String errorMsg;

  GetToDosErrorState({required this.errorMsg});

  List<Object> get props => [errorMsg];
}

// Sépala si los siguientes

class GetCompletedToDosSuccessState extends ToDoState {}

class GetCompletedToDosErrorState extends ToDoState {
  final String errorMsg;

  GetCompletedToDosErrorState({required this.errorMsg});

  List<Object> get props => [errorMsg];
}

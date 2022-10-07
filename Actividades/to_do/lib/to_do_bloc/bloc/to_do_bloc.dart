import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<AddToDoEvent>(_todoCreate);
    on<DeleteToDoEvent>(_todoDelete);
    on<CompleteToDoEvent>(_todoComplete);
    on<GetToDosEvent>(_getTodos);
    on<GetCompletedToDosEvent>(_getCompletedTodos);
  }

  List<String> toDos = []; //:C
  List<String> completedToDos = []; //:D ಥ_ಥ

  FutureOr<void> _todoCreate(event, emit) {
    try {
      toDos.add(event);
      emit(LoadedToDoState(toDos: toDos));
    } catch (e) {
      emit(ErrorState(error: "No se pudo agregar a la lista correctamente"));
    }
  }

  FutureOr<void> _todoDelete(event, emit) {
    try {
      toDos.removeWhere((toDo) => toDo == event.toDo);
      emit(DeleteToDoSuccessState());
    } catch (e) {
      emit(DeleteToDoErrorState(errorMsg: "Error al eliminar ToDo"));
    }
  }

  FutureOr<void> _todoComplete(event, emit) {}

  FutureOr<void> _getTodos(GetToDosEvent event, Emitter<ToDoState> emit) {}

  FutureOr<void> _getCompletedTodos(
      GetCompletedToDosEvent event, Emitter<ToDoState> emit) {}
}

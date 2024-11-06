import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

part "todo_event.dart";

class TodoList {
  final List<todoClass> todos;
  TodoList(this.todos);
}

class todoClass {
  String todo;
  bool status;
  String createdAt;
  todoClass(this.todo, this.status, this.createdAt);
}

class TodoOn extends TodoEvent {
  String todo;
  TodoOn(this.todo);
}

class TodoBloc extends Bloc<TodoEvent, TodoList> {
  TodoBloc() : super(TodoList([])) {
    on<addTodo>((event, emit) {
      if (event.todo.isEmpty) {
        addError("Todo cannot be empty", StackTrace.current);
        return;
      }
      state.todos.add(todoClass(event.todo, false, DateTime.now().toString()));
      emit(TodoList(state.todos));
    });
    on<UpdateTodo>((event, emit) {
      print("update todo");
      List<todoClass> updatedTodos = List.from(state.todos);
      updatedTodos[event.index] = todoClass(updatedTodos[event.index].todo,
          event.status, DateTime.now().toString());
      emit(TodoList(updatedTodos));
    });
    on<DeleteTodo>((event, emit) {
      List<todoClass> updatedTodos = List.from(state.todos);
      updatedTodos.removeAt(event.index);
      emit(TodoList(updatedTodos));
    });
  }

  final logger = Logger();

  @override
  void onChange(Change<TodoList> change) {
    super.onChange(change);
    logger.d(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    logger.d(error);
  }
}

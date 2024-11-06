part of 'todo_bloc.dart';

sealed class TodoEvent {}

class addTodo extends TodoEvent {
  String todo;
  addTodo(this.todo);
}

class UpdateTodo extends TodoEvent {
  int index;
  bool status;
  UpdateTodo(this.index, this.status);
}

class DeleteTodo extends TodoEvent {
  int index ;
  DeleteTodo(this.index);
}
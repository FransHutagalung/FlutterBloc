import 'package:bloc_learn/add_todo.dart';
import 'package:bloc_learn/bloc/todo_bloc.dart';
import 'package:bloc_learn/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aplikasi Todo",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoList>(
                builder: (context, state) {
                  final todo = state.todos;
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return TodoTile(
                        isDone: todo[index].status,
                        todo: todo[index].todo,
                        date: todo[index].createdAt,
                        index: index,
                        delete: (index) {
                          context.read<TodoBloc>().add(DeleteTodo(index));
                        },
                        onDoneChanged: (isDone) {
                          context
                              .read<TodoBloc>()
                              .add(UpdateTodo(index, isDone));
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTodo()));
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Tambah Todo",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

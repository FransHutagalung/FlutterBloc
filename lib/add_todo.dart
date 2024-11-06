import 'package:bloc_learn/bloc/todo_bloc.dart';
import 'package:bloc_learn/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController controller = TextEditingController();
  String newTodo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Masukkan Todo"),
              SizedBox(height: 20),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Masukkan Todo'),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              newTodo = controller.text;
              // if (!newTodo.isNotEmpty) {
              //   return;
              // }
              BlocProvider.of<TodoBloc>(context).add(addTodo(newTodo));
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Todo()));
            });
          },
          child: Text("Add Todo"),
        ),
      ),
    );
  }
}

import 'package:bloc_learn/MyHomePage.dart';
import 'package:bloc_learn/bloc/auth_bloc.dart';
import 'package:bloc_learn/bloc/counter_bloc.dart';
import 'package:bloc_learn/bloc/todo_bloc.dart';
import 'package:bloc_learn/cubit/counter_cubit.dart';
import 'package:bloc_learn/todo.dart';
import 'package:bloc_learn/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
          BlocProvider<CounterBloc>(create : (_) => CounterBloc()) ,
          BlocProvider<TodoBloc>(create : (_) => TodoBloc()),
          BlocProvider<AuthBloc>(create : (_) => AuthBloc())
        ],
        child: MaterialApp(
          
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const MyHomeage(title: "title"),
            home : LoginWidget()
          )
        );
  }
}

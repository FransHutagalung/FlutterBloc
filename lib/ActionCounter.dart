import 'package:bloc_learn/bloc/counter_bloc.dart';
import 'package:bloc_learn/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Actioncounter extends StatelessWidget {
  const Actioncounter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
                counterBloc.add(CounterIncremented());
              
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
                counterBloc.add(CounterDecremented());
            },
            child: Icon(Icons.remove),
          ),
        ],
      );
  }
}
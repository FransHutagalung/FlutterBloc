import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/todo_bloc.dart';

part 'counter_event.dart';

class CounterState {
  int value;
  CounterState(this.value);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterDecremented>((event, emit) {
      state.value > 0
          ? emit(CounterState(state.value - 1))
          : emit(CounterState(0));
    });
    on<CounterIncremented>(
        (event, emit) => {emit(CounterState(state.value + 1))});
  }
}

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override

  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate - ${bloc.runtimeType}');
  }
}

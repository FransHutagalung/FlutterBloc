import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignIn>((event, emit) async {
      final emailRegex =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

      if (!emailRegex.hasMatch(event.email)) {
        return emit(AuthError("Invalid email address"));
      }

      if (event.password.length < 10) {
        return emit(AuthError("Password is too short"));
      }

      return await Future.delayed(
        const Duration(seconds: 0),
        () => emit(AuthSuccess(
          uid : '${event.email} - ${event.password}'
        )),
      );
    });
  }
}

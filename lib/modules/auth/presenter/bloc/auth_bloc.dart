import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

abstract class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState);
}

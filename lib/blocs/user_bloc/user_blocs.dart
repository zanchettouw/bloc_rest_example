import 'package:bloc_rest_example/blocs/user_bloc/user_events.dart';
import 'package:bloc_rest_example/blocs/user_bloc/user_states.dart';
import 'package:bloc_rest_example/repo/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
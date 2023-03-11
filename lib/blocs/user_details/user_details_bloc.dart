import 'package:bloc/bloc.dart';
import 'package:bloc_rest_example/models/user_model.dart';
import 'package:bloc_rest_example/repo/repositories.dart';
import 'package:equatable/equatable.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserRepository _userRepository;

  UserDetailsBloc(this._userRepository) : super(UserDetailsInitial()) {
    on<LoadUserDetailsEvent>((event, emit) async {
      emit(UserDetailsLoading());
      try {
        final userDetails = await _userRepository.getuserDetails();
        emit(UserDetailsLoadedState(userDetails));
      } catch (e) {
        emit(UserDetailsErrorState(e.toString()));
      }
    });
  }
}

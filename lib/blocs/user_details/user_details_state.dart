part of 'user_details_bloc.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {
  @override
  List<Object> get props => [];
}

class UserDetailsLoadedState extends UserDetailsState {
  final UserModel userDetails;
  const UserDetailsLoadedState(this.userDetails);
  @override
  List<Object> get props => [userDetails];
}

class UserDetailsErrorState extends UserDetailsState {
  final String error;
  const UserDetailsErrorState(this.error);
  @override
  List<Object> get props => [error];
}
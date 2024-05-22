part of 'user_bloc.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserFailureState extends UserState {
  final String error;
  UserFailureState(this.error);
}

final class UserDeleteSuccessState extends UserState {
  final String message;

  UserDeleteSuccessState({required this.message});
}

final class UsersDisplaySuccessState extends UserState {
  final List<User> Users;

  UsersDisplaySuccessState(this.Users);
}

final class SearchUserSuccessState extends UserState {
  final List<User> Users;

  SearchUserSuccessState({required this.Users});
}

part of 'user_bloc.dart';

sealed class UserEvent {}

final class UsersDeleteEvent extends UserEvent {
  final String UserId;
  UsersDeleteEvent({required this.UserId});
}

final class GetAllUsersEvent extends UserEvent {}

final class DeleteUsersEvent extends UserEvent {
  final String UserId;

  DeleteUsersEvent({required this.UserId});
}

final class SearchUserEvent extends UserEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchUserEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

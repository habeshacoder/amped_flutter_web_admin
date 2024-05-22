part of 'profile_bloc.dart';

sealed class ProfileEvent {}

final class ProfilesDeleteEvent extends ProfileEvent {
  final String ProfileId;
  ProfilesDeleteEvent({required this.ProfileId});
}

final class GetAllProfilesEvent extends ProfileEvent {}

final class DeleteProfilesEvent extends ProfileEvent {
  final int ProfileId;

  DeleteProfilesEvent({required this.ProfileId});
}

final class SearchProfileEvent extends ProfileEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchProfileEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

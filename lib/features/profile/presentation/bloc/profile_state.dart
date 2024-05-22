part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileFailureState extends ProfileState {
  final String error;
  ProfileFailureState(this.error);
}

final class ProfileDeleteSuccessState extends ProfileState {
  final String message;

  ProfileDeleteSuccessState({required this.message});
}

final class ProfilesDisplaySuccessState extends ProfileState {
  final List<Profile> profiles;

  ProfilesDisplaySuccessState(this.profiles);
}

final class SearchProfileSuccessState extends ProfileState {
  final List<Profile> profiles;

  SearchProfileSuccessState({required this.profiles});
}

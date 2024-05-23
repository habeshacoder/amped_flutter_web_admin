part of 'replay_bloc.dart';

sealed class ReplayState {}

final class ReplayInitial extends ReplayState {}

final class ReplayLoading extends ReplayState {}

final class ReplayFailureState extends ReplayState {
  final String error;
  ReplayFailureState(this.error);
}

final class ReplayDeleteSuccessState extends ReplayState {
  final String message;

  ReplayDeleteSuccessState({required this.message});
}

final class ReplaysDisplaySuccessState extends ReplayState {
  final List<Replay> Replays;

  ReplaysDisplaySuccessState(this.Replays);
}

final class SearchReplaySuccessState extends ReplayState {
  final List<Replay> Replays;

  SearchReplaySuccessState({required this.Replays});
}

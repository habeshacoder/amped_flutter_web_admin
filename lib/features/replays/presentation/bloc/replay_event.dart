part of 'replay_bloc.dart';

sealed class ReplayEvent {}

final class ReplaysDeleteEvent extends ReplayEvent {
  final String ReplayId;
  ReplaysDeleteEvent({required this.ReplayId});
}

final class GetAllReplaysEvent extends ReplayEvent {}

final class DeleteReplaysEvent extends ReplayEvent {
  final int ReplayId;

  DeleteReplaysEvent({required this.ReplayId});
}

final class SearchReplayEvent extends ReplayEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchReplayEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

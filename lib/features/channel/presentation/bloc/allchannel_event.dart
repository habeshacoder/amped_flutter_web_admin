part of 'allchannels_bloc.dart';

sealed class ChannelEvent {}

final class ChannelsDeleteEvent extends ChannelEvent {
  final int channelId;
  ChannelsDeleteEvent({required this.channelId});
}

final class GetAllChannelsEvent extends ChannelEvent {}

final class DeleteChannelsEvent extends ChannelEvent {
  final int channelId;

  DeleteChannelsEvent({required this.channelId});
}

final class SearchChannelEvent extends ChannelEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchChannelEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

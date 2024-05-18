part of 'allchannels_bloc.dart';

sealed class ChannelEvent {}

final class ChannelsDeleteEvent extends ChannelEvent {
  final int channelId;
  ChannelsDeleteEvent({required this.channelId});
}

final class GetAllChannelsEvent extends ChannelEvent {}

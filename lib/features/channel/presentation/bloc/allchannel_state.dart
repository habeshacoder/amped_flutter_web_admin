part of 'allchannels_bloc.dart';

sealed class ChannelState {}

final class ChannelInitial extends ChannelState {}

final class ChannelLoading extends ChannelState {}

final class ChannelFailureState extends ChannelState {
  final String error;
  ChannelFailureState(this.error);
}

final class ChannelDeleteSuccessState extends ChannelState {
  final String message;

  ChannelDeleteSuccessState({required this.message});
}

final class ChannelsDisplaySuccessState extends ChannelState {
  final List<Channel> channels;

  ChannelsDisplaySuccessState(this.channels);
}

final class SearchChannelSuccessState extends ChannelState {
  final List<Channel> channels;

  SearchChannelSuccessState({required this.channels});
}

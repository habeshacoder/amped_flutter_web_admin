part of 'allchannels_bloc.dart';

sealed class ChannelState {}

final class ChannelInitial extends ChannelState {}

final class ChannelLoading extends ChannelState {}

final class ChannelFailureState extends ChannelState {
  final String error;
  ChannelFailureState(this.error);
}

final class ChannelDeleteSuccessState extends ChannelState {}

final class ChannelsDisplaySuccessState extends ChannelState {
  final List<Channel> channels;

  ChannelsDisplaySuccessState(this.channels);
}

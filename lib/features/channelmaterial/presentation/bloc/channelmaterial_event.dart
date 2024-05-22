part of 'channelmaterial_bloc.dart';

sealed class ChannelMaterialEvent {}

final class ChannelMaterialsDeleteEvent extends ChannelMaterialEvent {
  final int channelMaterialId;
  ChannelMaterialsDeleteEvent({required this.channelMaterialId});
}

final class GetAllChannelMaterialsEvent extends ChannelMaterialEvent {}

final class DeleteChannelMaterialsEvent extends ChannelMaterialEvent {
  final int channelMaterialId;

  DeleteChannelMaterialsEvent({required this.channelMaterialId});
}

final class SearchChannelMaterialEvent extends ChannelMaterialEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchChannelMaterialEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

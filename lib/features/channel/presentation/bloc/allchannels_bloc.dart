// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/channel/domain/usecases/search_channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:amped_media_admin/core/usecases/usecase.dart';

import '../../domain/entities/channel.dart';
import '../../domain/usecases/delete_channel.dart';
import '../../domain/usecases/get_all_channels.dart';

part 'allchannel_event.dart';
part 'allchannel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final GetAllChannels _getAllChannels;
  final DeleteChannel _deleteChannel;
  final SearchChannel _searchChannel;

  ChannelBloc({
    required GetAllChannels getAllChannels,
    required DeleteChannel deleteChannel,
    required SearchChannel searchChannel,
  })  : _getAllChannels = getAllChannels,
        _deleteChannel = deleteChannel,
        _searchChannel = searchChannel,
        super(ChannelInitial()) {
    on<ChannelEvent>((event, emit) => emit(ChannelLoading()));
    on<GetAllChannelsEvent>(_onChannelFetchEvent);
    on<DeleteChannelsEvent>(_onDeleteChannelEvent);
    on<SearchChannelEvent>(_onSearchChannelEvent);
  }

  void _onChannelFetchEvent(
    GetAllChannelsEvent event,
    Emitter<ChannelState> emit,
  ) async {
    emit(ChannelLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllChannels.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ChannelFailureState(failure.message)),
      (success) => emit(ChannelsDisplaySuccessState(success)),
    );
  }

  void _onDeleteChannelEvent(
    DeleteChannelsEvent event,
    Emitter<ChannelState> emit,
  ) async {
    emit(ChannelLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteChannel
        .call(DeleteChannelParams(channelId: event.channelId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ChannelFailureState(failure.message)),
      (success) => emit(ChannelDeleteSuccessState(message: success)),
    );
  }

  void _onSearchChannelEvent(
    SearchChannelEvent event,
    Emitter<ChannelState> emit,
  ) async {
    emit(ChannelLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchChannel.call(SearchChannelParam(
        key: event.key, time_from: event.time_from, time_to: event.time_to));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(ChannelFailureState(failure.message)),
      (success) => emit(SearchChannelSuccessState(channels: success)),
    );
  }
}

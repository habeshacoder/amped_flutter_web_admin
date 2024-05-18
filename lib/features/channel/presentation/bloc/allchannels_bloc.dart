import 'package:amped_media_admin/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/channel.dart';
import '../../domain/usecases/get_all_channels.dart';
part 'allchannel_event.dart';
part 'allchannel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final GetAllChannels _getAllChannels;
  // final DeleteChannel _deleteChannel;

  ChannelBloc({
    required GetAllChannels getAllChannels,
    // required DeleteChannel deleteChannel,
  })  : _getAllChannels = getAllChannels,
        // _deleteChannel = deleteChannel,
        super(ChannelInitial()) {
    on<ChannelEvent>((event, emit) => emit(ChannelLoading()));
    on<GetAllChannelsEvent>(_onChannelFetchEvent);
  }

  void _onChannelFetchEvent(
    GetAllChannelsEvent event,
    Emitter<ChannelState> emit,
  ) async {
    final res = await _getAllChannels.call(NoParams());

    res.fold(
      (failure) => emit(ChannelFailureState(failure.message)),
      (success) => emit(ChannelsDisplaySuccessState(success)),
    );
  }
}

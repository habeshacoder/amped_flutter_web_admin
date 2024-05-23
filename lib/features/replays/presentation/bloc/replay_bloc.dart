// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';

import '../../domain/entities/replays.dart';
import '../../domain/usecases/delete_replays.dart';
import '../../domain/usecases/get_all_replays.dart';
import '../../domain/usecases/search_replays.dart';
part 'replay_event.dart';
part 'replay_state.dart';

class ReplayBloc extends Bloc<ReplayEvent, ReplayState> {
  final GetAllReplays _getAllReplays;
  final DeleteReplay _deleteReplay;
  final SearchReplay _searchReplay;

  ReplayBloc(
      {required GetAllReplays getAllReplays,
      required DeleteReplay deleteReplay,
      required SearchReplay searchReplay})
      : _getAllReplays = getAllReplays,
        _deleteReplay = deleteReplay,
        _searchReplay = searchReplay,
        super(ReplayInitial()) {
    on<ReplayEvent>((event, emit) => emit(ReplayLoading()));
    on<GetAllReplaysEvent>(_onReplayFetchEvent);
    on<DeleteReplaysEvent>(_onDeleteReplayEvent);
    on<SearchReplayEvent>(_onSearchReplayEvent);
  }

  void _onReplayFetchEvent(
    GetAllReplaysEvent event,
    Emitter<ReplayState> emit,
  ) async {
    emit(ReplayLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllReplays.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ReplayFailureState(failure.message)),
      (success) => emit(ReplaysDisplaySuccessState(success)),
    );
  }

  void _onDeleteReplayEvent(
    DeleteReplaysEvent event,
    Emitter<ReplayState> emit,
  ) async {
    emit(ReplayLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res =
        await _deleteReplay.call(DeleteReplayParams(ReplayId: event.ReplayId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ReplayFailureState(failure.message)),
      (success) => emit(ReplayDeleteSuccessState(message: success)),
    );
  }

  void _onSearchReplayEvent(
    SearchReplayEvent event,
    Emitter<ReplayState> emit,
  ) async {
    emit(ReplayLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchReplay.call(SearchReplayParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(ReplayFailureState(failure.message)),
      (success) => emit(SearchReplaySuccessState(Replays: success)),
    );
  }
}

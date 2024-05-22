// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';
import '../../domain/entities/channelmaterial.dart';
import '../../domain/usecases/delete_channelmaterial.dart';
import '../../domain/usecases/get_all_channelmaterials.dart';
import '../../domain/usecases/search_channelmaterial.dart';
part 'channelmaterial_event.dart';
part 'channelmaterials_state.dart';

class ChannelMaterialBloc
    extends Bloc<ChannelMaterialEvent, ChannelMaterialsState> {
  final GetAllChannelMaterials _getAllChannelMaterials;
  final DeleteChannelMaterial _deleteChannelMaterial;
  final SearchChannelMaterial _searchChannelMaterial;

  ChannelMaterialBloc(
      {required GetAllChannelMaterials getAllChannelMaterials,
      required DeleteChannelMaterial deleteChannelMaterial,
      required SearchChannelMaterial searchChannelMaterial})
      : _getAllChannelMaterials = getAllChannelMaterials,
        _deleteChannelMaterial = deleteChannelMaterial,
        _searchChannelMaterial = searchChannelMaterial,
        super(ChannelMaterialInitial()) {
    on<ChannelMaterialEvent>((event, emit) => emit(ChannelMaterialLoading()));
    on<GetAllChannelMaterialsEvent>(_onChannelMaterialFetchEvent);
    on<DeleteChannelMaterialsEvent>(_onDeleteChannelMaterialEvent);
    on<SearchChannelMaterialEvent>(_onSearchChannelMaterialEvent);
  }

  void _onChannelMaterialFetchEvent(
    GetAllChannelMaterialsEvent event,
    Emitter<ChannelMaterialsState> emit,
  ) async {
    emit(ChannelMaterialLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllChannelMaterials.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ChannelMaterialFailureState(failure.message)),
      (success) => emit(ChannelMaterialsDisplaySuccessState(success)),
    );
  }

  void _onDeleteChannelMaterialEvent(
    DeleteChannelMaterialsEvent event,
    Emitter<ChannelMaterialsState> emit,
  ) async {
    emit(ChannelMaterialLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteChannelMaterial.call(DeleteChannelMaterialParams(
        ChannelmaterialId: event.channelMaterialId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ChannelMaterialFailureState(failure.message)),
      (success) => emit(ChannelMaterialDeleteSuccessState(message: success)),
    );
  }

  void _onSearchChannelMaterialEvent(
    SearchChannelMaterialEvent event,
    Emitter<ChannelMaterialsState> emit,
  ) async {
    emit(ChannelMaterialLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchChannelMaterial.call(SearchChannelMaterialParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(ChannelMaterialFailureState(failure.message)),
      (success) =>
          emit(SearchChannelMaterialSuccessState(ChannelMaterials: success)),
    );
  }
}

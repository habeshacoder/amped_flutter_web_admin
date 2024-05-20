// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/material/domain/usecases/delete_material.dart';
import 'package:amped_media_admin/features/material/domain/usecases/get_all_materials.dart';
import 'package:amped_media_admin/features/material/domain/usecases/search_material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';
import '../../domain/entities/material.dart';
part 'material_event.dart';
part 'materials_state.dart';

class MaterialBloc extends Bloc<MaterialEvent, MaterialsState> {
  final GetAllMaterials _getAllMaterials;
  final DeleteMaterial _deleteMaterial;
  final SearchMaterial _searchMaterial;

  MaterialBloc(
      {required GetAllMaterials getAllMaterials,
      required DeleteMaterial deleteMaterial,
      required SearchMaterial searchMaterial})
      : _getAllMaterials = getAllMaterials,
        _deleteMaterial = deleteMaterial,
        _searchMaterial = searchMaterial,
        super(MaterialInitial()) {
    on<MaterialEvent>((event, emit) => emit(MaterialLoading()));
    on<GetAllMaterialsEvent>(_onMaterialFetchEvent);
    on<DeleteMaterialsEvent>(_onDeleteMaterialEvent);
    on<SearchMaterialEvent>(_onSearchMaterialEvent);
  }

  void _onMaterialFetchEvent(
    GetAllMaterialsEvent event,
    Emitter<MaterialsState> emit,
  ) async {
    emit(MaterialLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllMaterials.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(MaterialFailureState(failure.message)),
      (success) => emit(MaterialsDisplaySuccessState(success)),
    );
  }

  void _onDeleteMaterialEvent(
    DeleteMaterialsEvent event,
    Emitter<MaterialsState> emit,
  ) async {
    emit(MaterialLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteMaterial
        .call(DeleteMaterialParams(materialId: event.MaterialId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(MaterialFailureState(failure.message)),
      (success) => emit(MaterialDeleteSuccessState(message: success)),
    );
  }

  void _onSearchMaterialEvent(
    SearchMaterialEvent event,
    Emitter<MaterialsState> emit,
  ) async {
    emit(MaterialLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchMaterial.call(SearchMaterialParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(MaterialFailureState(failure.message)),
      (success) => emit(SearchMaterialSuccessState(Materials: success)),
    );
  }
}

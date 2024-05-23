import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';

import '../../domain/entities/material_in_subscriptionplan.dart';
import '../../domain/usecases/delete_materialin_subscriptionplan.dart';
import '../../domain/usecases/get_all_materialin_subscriptionplan.dart';
import '../../domain/usecases/search_materialin_subscriptionplan.dart';
part 'materialin_subscriptionplan_event.dart';
part 'materialin_subscriptionplan_state.dart';

class MaterialInSubscriptionPlanBloc extends Bloc<
    MaterialInSubscriptionPlanEvent, MaterialInSubscriptionPlanState> {
  final GetAllMaterialInSubscriptionPlan _getAllMaterialInSubscriptionPlans;
  final DeleteMaterialInSubscriptionPlan _deleteMaterialInSubscriptionPlan;
  final SearchMaterialInSubscriptionPlan _searchMaterialInSubscriptionPlan;

  MaterialInSubscriptionPlanBloc(
      {required GetAllMaterialInSubscriptionPlan
          getAllMaterialInSubscriptionPlans,
      required DeleteMaterialInSubscriptionPlan
          deleteMaterialInSubscriptionPlan,
      required SearchMaterialInSubscriptionPlan
          searchMaterialInSubscriptionPlan})
      : _getAllMaterialInSubscriptionPlans = getAllMaterialInSubscriptionPlans,
        _deleteMaterialInSubscriptionPlan = deleteMaterialInSubscriptionPlan,
        _searchMaterialInSubscriptionPlan = searchMaterialInSubscriptionPlan,
        super(MaterialInSubscriptionPlanInitial()) {
    on<MaterialInSubscriptionPlanEvent>(
        (event, emit) => emit(MaterialInSubscriptionPlanLoading()));
    on<GetAllMaterialInSubscriptionPlansEvent>(
        _onMaterialInSubscriptionPlanFetchEvent);
    on<DeleteMaterialInSubscriptionPlansEvent>(
        _onDeleteMaterialInSubscriptionPlanEvent);
    on<SearchMaterialInSubscriptionPlanEvent>(
        _onSearchMaterialInSubscriptionPlanEvent);
  }

  void _onMaterialInSubscriptionPlanFetchEvent(
    GetAllMaterialInSubscriptionPlansEvent event,
    Emitter<MaterialInSubscriptionPlanState> emit,
  ) async {
    emit(MaterialInSubscriptionPlanLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllMaterialInSubscriptionPlans.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) =>
          emit(MaterialInSubscriptionPlanFailureState(failure.message)),
      (success) =>
          emit(MaterialInSubscriptionPlansDisplaySuccessState(success)),
    );
  }

  void _onDeleteMaterialInSubscriptionPlanEvent(
    DeleteMaterialInSubscriptionPlansEvent event,
    Emitter<MaterialInSubscriptionPlanState> emit,
  ) async {
    emit(MaterialInSubscriptionPlanLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteMaterialInSubscriptionPlan.call(
        DeleteMaterialInSubscriptionPlanParams(
            MaterialInSubscriptionPlanId: event.MaterialInSubscriptionPlanId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) =>
          emit(MaterialInSubscriptionPlanFailureState(failure.message)),
      (success) =>
          emit(MaterialInSubscriptionPlanDeleteSuccessState(message: success)),
    );
  }

  void _onSearchMaterialInSubscriptionPlanEvent(
    SearchMaterialInSubscriptionPlanEvent event,
    Emitter<MaterialInSubscriptionPlanState> emit,
  ) async {
    emit(MaterialInSubscriptionPlanLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchMaterialInSubscriptionPlan
        .call(SearchMaterialInSubscriptionPlanParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) =>
          emit(MaterialInSubscriptionPlanFailureState(failure.message)),
      (success) => emit(SearchMaterialInSubscriptionPlanSuccessState(
          MaterialInSubscriptionPlans: success)),
    );
  }
}

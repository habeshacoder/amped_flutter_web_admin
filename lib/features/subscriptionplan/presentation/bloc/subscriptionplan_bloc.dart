import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';

import '../../domain/entities/subscriptionplan.dart';
import '../../domain/usecases/delete_subscriptionplan.dart';
import '../../domain/usecases/get_all_subscriptionplan.dart';
import '../../domain/usecases/search_subscriptionplan.dart';
part 'subscriptionplan_event.dart';
part 'subscriptionplan_state.dart';

class SubscriptionPlanBloc
    extends Bloc<SubscriptionPlanEvent, SubscriptionPlanState> {
  final GetAllSubscriptionPlan _GetAllSubscriptionPlan;
  final DeleteSubscriptionPlan _deleteSubscriptionPlan;
  final SearchSubscriptionPlan _searchSubscriptionPlan;

  SubscriptionPlanBloc(
      {required GetAllSubscriptionPlan getAllSubscriptionPlan,
      required DeleteSubscriptionPlan deleteSubscriptionPlan,
      required SearchSubscriptionPlan searchSubscriptionPlan})
      : _GetAllSubscriptionPlan = getAllSubscriptionPlan,
        _deleteSubscriptionPlan = deleteSubscriptionPlan,
        _searchSubscriptionPlan = searchSubscriptionPlan,
        super(SubscriptionPlanInitial()) {
    on<SubscriptionPlanEvent>((event, emit) => emit(SubscriptionPlanLoading()));
    on<GetAllSubscriptionPlansEvent>(_onSubscriptionPlanFetchEvent);
    on<DeleteSubscriptionPlansEvent>(_onDeleteSubscriptionPlanEvent);
    on<SearchSubscriptionPlanEvent>(_onSearchSubscriptionPlanEvent);
  }

  void _onSubscriptionPlanFetchEvent(
    GetAllSubscriptionPlansEvent event,
    Emitter<SubscriptionPlanState> emit,
  ) async {
    emit(SubscriptionPlanLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _GetAllSubscriptionPlan.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(SubscriptionPlanFailureState(failure.message)),
      (success) => emit(SubscriptionPlansDisplaySuccessState(success)),
    );
  }

  void _onDeleteSubscriptionPlanEvent(
    DeleteSubscriptionPlansEvent event,
    Emitter<SubscriptionPlanState> emit,
  ) async {
    emit(SubscriptionPlanLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteSubscriptionPlan.call(DeleteSubscriptionPlanParams(
        SubscriptionPlanId: event.SubscriptionPlanId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(SubscriptionPlanFailureState(failure.message)),
      (success) => emit(SubscriptionPlanDeleteSuccessState(message: success)),
    );
  }

  void _onSearchSubscriptionPlanEvent(
    SearchSubscriptionPlanEvent event,
    Emitter<SubscriptionPlanState> emit,
  ) async {
    emit(SubscriptionPlanLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchSubscriptionPlan.call(SearchSubscriptionPlanParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(SubscriptionPlanFailureState(failure.message)),
      (success) =>
          emit(SearchSubscriptionPlanSuccessState(SubscriptionPlans: success)),
    );
  }
}

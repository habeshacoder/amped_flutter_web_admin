// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';
import '../../domain/entities/rate.dart';
import '../../domain/ussecases/delete_rate.dart';
import '../../domain/ussecases/get_all_rate.dart';
import '../../domain/ussecases/search_rate.dart';
part 'rate_event.dart';
part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final GetAllRate _getAllRates;
  final DeleteRate _deleteRate;
  final SearchRate _searchRate;

  RateBloc(
      {required GetAllRate getAllRates,
      required DeleteRate deleteRate,
      required SearchRate searchRate})
      : _getAllRates = getAllRates,
        _deleteRate = deleteRate,
        _searchRate = searchRate,
        super(RateInitial()) {
    on<RateEvent>((event, emit) => emit(RateLoading()));
    on<GetAllRatesEvent>(_onRateFetchEvent);
    on<DeleteRatesEvent>(_onDeleteRateEvent);
    on<SearchRateEvent>(_onSearchRateEvent);
  }

  void _onRateFetchEvent(
    GetAllRatesEvent event,
    Emitter<RateState> emit,
  ) async {
    emit(RateLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllRates.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(RateFailureState(failure.message)),
      (success) => emit(RatesDisplaySuccessState(success)),
    );
  }

  void _onDeleteRateEvent(
    DeleteRatesEvent event,
    Emitter<RateState> emit,
  ) async {
    emit(RateLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteRate.call(DeleteRateParams(RateId: event.RateId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(RateFailureState(failure.message)),
      (success) => emit(RateDeleteSuccessState(message: success)),
    );
  }

  void _onSearchRateEvent(
    SearchRateEvent event,
    Emitter<RateState> emit,
  ) async {
    emit(RateLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchRate.call(SearchRateParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(RateFailureState(failure.message)),
      (success) => emit(SearchRateSuccessState(Rates: success)),
    );
  }
}

part of 'rate_bloc.dart';

sealed class RateState {}

final class RateInitial extends RateState {}

final class RateLoading extends RateState {}

final class RateFailureState extends RateState {
  final String error;
  RateFailureState(this.error);
}

final class RateDeleteSuccessState extends RateState {
  final String message;

  RateDeleteSuccessState({required this.message});
}

final class RatesDisplaySuccessState extends RateState {
  final List<Rate> Rates;

  RatesDisplaySuccessState(this.Rates);
}

final class SearchRateSuccessState extends RateState {
  final List<Rate> Rates;

  SearchRateSuccessState({required this.Rates});
}

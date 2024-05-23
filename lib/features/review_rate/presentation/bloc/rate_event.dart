part of 'rate_bloc.dart';

sealed class RateEvent {}

final class RatesDeleteEvent extends RateEvent {
  final String RateId;
  RatesDeleteEvent({required this.RateId});
}

final class GetAllRatesEvent extends RateEvent {}

final class DeleteRatesEvent extends RateEvent {
  final int RateId;

  DeleteRatesEvent({required this.RateId});
}

final class SearchRateEvent extends RateEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchRateEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

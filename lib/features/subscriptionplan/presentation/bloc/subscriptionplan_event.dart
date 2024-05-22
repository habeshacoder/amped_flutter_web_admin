part of 'subscriptionplan_bloc.dart';

sealed class SubscriptionPlanEvent {}

final class SubscriptionPlansDeleteEvent extends SubscriptionPlanEvent {
  final String SubscriptionPlanId;
  SubscriptionPlansDeleteEvent({required this.SubscriptionPlanId});
}

final class GetAllSubscriptionPlansEvent extends SubscriptionPlanEvent {}

final class DeleteSubscriptionPlansEvent extends SubscriptionPlanEvent {
  final int SubscriptionPlanId;

  DeleteSubscriptionPlansEvent({required this.SubscriptionPlanId});
}

final class SearchSubscriptionPlanEvent extends SubscriptionPlanEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchSubscriptionPlanEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

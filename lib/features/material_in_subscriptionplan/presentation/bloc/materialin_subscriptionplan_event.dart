part of 'materialin_subscriptionplan_bloc.dart';

sealed class MaterialInSubscriptionPlanEvent {}

final class MaterialInSubscriptionPlansDeleteEvent
    extends MaterialInSubscriptionPlanEvent {
  final String MaterialInSubscriptionPlanId;
  MaterialInSubscriptionPlansDeleteEvent(
      {required this.MaterialInSubscriptionPlanId});
}

final class GetAllMaterialInSubscriptionPlansEvent
    extends MaterialInSubscriptionPlanEvent {}

final class DeleteMaterialInSubscriptionPlansEvent
    extends MaterialInSubscriptionPlanEvent {
  final int MaterialInSubscriptionPlanId;

  DeleteMaterialInSubscriptionPlansEvent(
      {required this.MaterialInSubscriptionPlanId});
}

final class SearchMaterialInSubscriptionPlanEvent
    extends MaterialInSubscriptionPlanEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchMaterialInSubscriptionPlanEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

part of 'subscriptionplan_bloc.dart';

sealed class SubscriptionPlanState {}

final class SubscriptionPlanInitial extends SubscriptionPlanState {}

final class SubscriptionPlanLoading extends SubscriptionPlanState {}

final class SubscriptionPlanFailureState extends SubscriptionPlanState {
  final String error;
  SubscriptionPlanFailureState(this.error);
}

final class SubscriptionPlanDeleteSuccessState extends SubscriptionPlanState {
  final String message;

  SubscriptionPlanDeleteSuccessState({required this.message});
}

final class SubscriptionPlansDisplaySuccessState extends SubscriptionPlanState {
  final List<SubscriptionPlan> SubscriptionPlans;

  SubscriptionPlansDisplaySuccessState(this.SubscriptionPlans);
}

final class SearchSubscriptionPlanSuccessState extends SubscriptionPlanState {
  final List<SubscriptionPlan> SubscriptionPlans;

  SearchSubscriptionPlanSuccessState({required this.SubscriptionPlans});
}

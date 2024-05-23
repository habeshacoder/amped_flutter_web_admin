part of 'materialin_subscriptionplan_bloc.dart';

sealed class MaterialInSubscriptionPlanState {}

final class MaterialInSubscriptionPlanInitial
    extends MaterialInSubscriptionPlanState {}

final class MaterialInSubscriptionPlanLoading
    extends MaterialInSubscriptionPlanState {}

final class MaterialInSubscriptionPlanFailureState
    extends MaterialInSubscriptionPlanState {
  final String error;
  MaterialInSubscriptionPlanFailureState(this.error);
}

final class MaterialInSubscriptionPlanDeleteSuccessState
    extends MaterialInSubscriptionPlanState {
  final String message;

  MaterialInSubscriptionPlanDeleteSuccessState({required this.message});
}

final class MaterialInSubscriptionPlansDisplaySuccessState
    extends MaterialInSubscriptionPlanState {
  final List<MaterialInSubscriptionPlan> MaterialInSubscriptionPlans;

  MaterialInSubscriptionPlansDisplaySuccessState(
      this.MaterialInSubscriptionPlans);
}

final class SearchMaterialInSubscriptionPlanSuccessState
    extends MaterialInSubscriptionPlanState {
  final List<MaterialInSubscriptionPlan> MaterialInSubscriptionPlans;

  SearchMaterialInSubscriptionPlanSuccessState(
      {required this.MaterialInSubscriptionPlans});
}

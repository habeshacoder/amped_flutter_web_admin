import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/material_in_subscriptionplan.dart';

abstract interface class MaterialInSubscriptionPlanRepository {
  Future<Either<Failure, String>> deleteMaterialInSubscriptionPlan(
      int MaterialInSubscriptionPlanId);
  Future<Either<Failure, List<MaterialInSubscriptionPlan>>>
      getAllMaterialInSubscriptionPlan();
  Future<Either<Failure, List<MaterialInSubscriptionPlan>>>
      searchMaterialInSubscriptionPlan({
    String? key,
    String? time_from,
    String? time_to,
  });
}

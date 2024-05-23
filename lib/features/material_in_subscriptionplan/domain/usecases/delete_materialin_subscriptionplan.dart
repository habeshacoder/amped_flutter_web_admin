import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/materialin_subscriptionplan_repositories.dart';

class DeleteMaterialInSubscriptionPlan
    implements UseCase<String, DeleteMaterialInSubscriptionPlanParams> {
  final MaterialInSubscriptionPlanRepository
      materialInSubscriptionPlanRepository;

  DeleteMaterialInSubscriptionPlan(
      {required this.materialInSubscriptionPlanRepository});

  @override
  Future<Either<Failure, String>> call(
      DeleteMaterialInSubscriptionPlanParams params) async {
    return await materialInSubscriptionPlanRepository
        .deleteMaterialInSubscriptionPlan(params.MaterialInSubscriptionPlanId);
  }
}

class DeleteMaterialInSubscriptionPlanParams {
  final int MaterialInSubscriptionPlanId;
  DeleteMaterialInSubscriptionPlanParams(
      {required this.MaterialInSubscriptionPlanId});
}

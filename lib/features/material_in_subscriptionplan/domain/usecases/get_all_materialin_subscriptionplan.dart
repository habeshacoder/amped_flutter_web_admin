import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/material_in_subscriptionplan.dart';
import '../repositories/materialin_subscriptionplan_repositories.dart';

class GetAllMaterialInSubscriptionPlan
    implements UseCase<List<MaterialInSubscriptionPlan>, NoParams> {
  final MaterialInSubscriptionPlanRepository
      materialInSubscriptionPlanRepository;

  GetAllMaterialInSubscriptionPlan(
      {required this.materialInSubscriptionPlanRepository});

  @override
  Future<Either<Failure, List<MaterialInSubscriptionPlan>>> call(
      NoParams params) async {
    return await materialInSubscriptionPlanRepository
        .getAllMaterialInSubscriptionPlan();
  }
}

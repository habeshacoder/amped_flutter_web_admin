import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/material_in_subscriptionplan.dart';
import '../repositories/materialin_subscriptionplan_repositories.dart';

class SearchMaterialInSubscriptionPlan
    implements
        UseCase<List<MaterialInSubscriptionPlan>,
            SearchMaterialInSubscriptionPlanParam> {
  final MaterialInSubscriptionPlanRepository
      materialInSubscriptionPlanRepository;
  SearchMaterialInSubscriptionPlan(
      {required this.materialInSubscriptionPlanRepository});

  @override
  Future<Either<Failure, List<MaterialInSubscriptionPlan>>> call(
      SearchMaterialInSubscriptionPlanParam params) async {
    return await materialInSubscriptionPlanRepository
        .searchMaterialInSubscriptionPlan(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchMaterialInSubscriptionPlanParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchMaterialInSubscriptionPlanParam(
      {required this.key, required this.time_from, required this.time_to});
}

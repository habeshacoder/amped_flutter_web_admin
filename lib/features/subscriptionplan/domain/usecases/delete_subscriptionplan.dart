import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/subscriptionplan_repositories.dart';

class DeleteSubscriptionPlan
    implements UseCase<String, DeleteSubscriptionPlanParams> {
  final SubscriptionPlanRepository subscriptionPlanRepository;

  DeleteSubscriptionPlan({required this.subscriptionPlanRepository});

  @override
  Future<Either<Failure, String>> call(
      DeleteSubscriptionPlanParams params) async {
    return await subscriptionPlanRepository
        .deleteSubscriptionPlan(params.SubscriptionPlanId);
  }
}

class DeleteSubscriptionPlanParams {
  final int SubscriptionPlanId;
  DeleteSubscriptionPlanParams({required this.SubscriptionPlanId});
}

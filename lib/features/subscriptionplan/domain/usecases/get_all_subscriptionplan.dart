import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/subscriptionplan.dart';
import '../repositories/subscriptionplan_repositories.dart';

class GetAllSubscriptionPlan
    implements UseCase<List<SubscriptionPlan>, NoParams> {
  final SubscriptionPlanRepository subscriptionPlanRepository;

  GetAllSubscriptionPlan({required this.subscriptionPlanRepository});

  @override
  Future<Either<Failure, List<SubscriptionPlan>>> call(NoParams params) async {
    return await subscriptionPlanRepository.getAllSubscriptionPlan();
  }
}

import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/subscriptionplan.dart';
import '../repositories/subscriptionplan_repositories.dart';

class SearchSubscriptionPlan
    implements UseCase<List<SubscriptionPlan>, SearchSubscriptionPlanParam> {
  final SubscriptionPlanRepository subscriptionPlanRepository;
  SearchSubscriptionPlan({required this.subscriptionPlanRepository});

  @override
  Future<Either<Failure, List<SubscriptionPlan>>> call(
      SearchSubscriptionPlanParam params) async {
    return await subscriptionPlanRepository.searchSubscriptionPlan(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchSubscriptionPlanParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchSubscriptionPlanParam(
      {required this.key, required this.time_from, required this.time_to});
}

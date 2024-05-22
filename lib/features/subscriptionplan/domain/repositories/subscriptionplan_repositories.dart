import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/subscriptionplan.dart';

abstract interface class SubscriptionPlanRepository {
  Future<Either<Failure, String>> deleteSubscriptionPlan(
      int SubscriptionPlanId);
  Future<Either<Failure, List<SubscriptionPlan>>> getAllSubscriptionPlan();
  Future<Either<Failure, List<SubscriptionPlan>>> searchSubscriptionPlan({
    String? key,
    String? time_from,
    String? time_to,
  });
}

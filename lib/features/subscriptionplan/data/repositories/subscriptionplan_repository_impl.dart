import 'package:amped_media_admin/core/error/failure.dart';
import 'package:amped_media_admin/features/subscriptionplan/data/datasources/subscriptionPlan_remote_data_source.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/subscriptionplan_repositories.dart';
import '../models/subscriptionplan_model.dart';

class SubscriptionPlanRepositoryImpl implements SubscriptionPlanRepository {
  final SubscriptionPlanRemoteDataSource subscriptionPlanRemoteDataSource;

  SubscriptionPlanRepositoryImpl(
      {required this.subscriptionPlanRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteSubscriptionPlan(
      int SubscriptionPlanId) async {
    try {
      final message = await subscriptionPlanRemoteDataSource
          .deleteSubscriptionPlan(name: SubscriptionPlanId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubscriptionPlanModel>>>
      getAllSubscriptionPlan() async {
    try {
      final SubscriptionPlans =
          await subscriptionPlanRemoteDataSource.getAllSubscriptionPlans();
      return right(SubscriptionPlans);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubscriptionPlanModel>>> searchSubscriptionPlan(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final SubscriptionPlans =
          await subscriptionPlanRemoteDataSource.searchSubscriptionPlan(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(SubscriptionPlans);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

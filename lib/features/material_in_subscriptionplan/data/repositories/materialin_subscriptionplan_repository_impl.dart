import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/materialin_subscriptionplan_repositories.dart';
import '../datasources/materin_subscriptionplan_remote_data_source.dart';
import '../models/material_in_subscriptionplan_model.dart';

class MaterialInSubscriptionPlanRepositoryImpl
    implements MaterialInSubscriptionPlanRepository {
  final MaterialInSubscriptionPlanRemoteDataSource
      materialInSubscriptionPlanRemoteDataSource;

  MaterialInSubscriptionPlanRepositoryImpl(
      {required this.materialInSubscriptionPlanRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteMaterialInSubscriptionPlan(
      int MaterialInSubscriptionPlanId) async {
    try {
      final message = await materialInSubscriptionPlanRemoteDataSource
          .deleteMaterialInSubscriptionPlan(
              materialInSubscriptionPlanId: MaterialInSubscriptionPlanId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MaterialInSubscriptionPlanModel>>>
      getAllMaterialInSubscriptionPlan() async {
    try {
      final MaterialInSubscriptionPlans =
          await materialInSubscriptionPlanRemoteDataSource
              .getAllMaterialInSubscriptionPlans();
      return right(MaterialInSubscriptionPlans);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MaterialInSubscriptionPlanModel>>>
      searchMaterialInSubscriptionPlan(
          {String? key, String? time_from, String? time_to}) async {
    try {
      final MaterialInSubscriptionPlans =
          await materialInSubscriptionPlanRemoteDataSource
              .searchMaterialInSubscriptionPlan(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(MaterialInSubscriptionPlans);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

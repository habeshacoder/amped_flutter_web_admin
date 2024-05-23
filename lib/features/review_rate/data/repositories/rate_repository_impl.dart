import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/rate_repositories.dart';
import '../datasources/rate_remote_data_source.dart';
import '../models/rate_model.dart';

class RateRepositoryImpl implements RateRepository {
  final RateRemoteDataSource rateRemoteDataSource;

  RateRepositoryImpl({required this.rateRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteRate(int RateId) async {
    try {
      final message = await rateRemoteDataSource.deleteRate(RateId: RateId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RateModel>>> getAllRate() async {
    try {
      final rates = await rateRemoteDataSource.getAllRates();
      return right(rates);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RateModel>>> searchRate(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final Rates = await rateRemoteDataSource.searchRate(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(Rates);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

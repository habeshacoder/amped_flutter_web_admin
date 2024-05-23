import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/rate.dart';

abstract interface class RateRepository {
  Future<Either<Failure, String>> deleteRate(int RateId);
  Future<Either<Failure, List<Rate>>> getAllRate();
  Future<Either<Failure, List<Rate>>> searchRate({
    String? key,
    String? time_from,
    String? time_to,
  });
}

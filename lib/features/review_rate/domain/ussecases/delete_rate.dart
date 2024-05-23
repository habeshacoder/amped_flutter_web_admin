import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/rate_repositories.dart';

class DeleteRate implements UseCase<String, DeleteRateParams> {
  final RateRepository rateRepository;

  DeleteRate({required this.rateRepository});

  @override
  Future<Either<Failure, String>> call(DeleteRateParams params) async {
    return await rateRepository.deleteRate(params.RateId);
  }
}

class DeleteRateParams {
  final int RateId;
  DeleteRateParams({required this.RateId});
}

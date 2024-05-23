import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/rate.dart';
import '../repositories/rate_repositories.dart';

class GetAllRate implements UseCase<List<Rate>, NoParams> {
  final RateRepository ratesRepository;

  GetAllRate({required this.ratesRepository});

  @override
  Future<Either<Failure, List<Rate>>> call(NoParams params) async {
    return await ratesRepository.getAllRate();
  }
}

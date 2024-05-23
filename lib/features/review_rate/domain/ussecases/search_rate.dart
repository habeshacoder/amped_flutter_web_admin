import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/rate.dart';
import '../repositories/rate_repositories.dart';

class SearchRate implements UseCase<List<Rate>, SearchRateParam> {
  final RateRepository rateRepository;
  SearchRate({required this.rateRepository});

  @override
  Future<Either<Failure, List<Rate>>> call(SearchRateParam params) async {
    return await rateRepository.searchRate(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchRateParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchRateParam(
      {required this.key, required this.time_from, required this.time_to});
}

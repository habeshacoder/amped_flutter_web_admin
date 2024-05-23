import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/reports.dart';
import '../repositories/report_repositories.dart';

class GetAllReports implements UseCase<List<Report>, NoParams> {
  final ReportRepository reportsRepository;

  GetAllReports({required this.reportsRepository});

  @override
  Future<Either<Failure, List<Report>>> call(NoParams params) async {
    return await reportsRepository.getAllReport();
  }
}

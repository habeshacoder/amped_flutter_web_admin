import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/reports.dart';
import '../repositories/report_repositories.dart';

class SearchReport implements UseCase<List<Report>, SearchReportParam> {
  final ReportRepository reportRepository;
  SearchReport({required this.reportRepository});

  @override
  Future<Either<Failure, List<Report>>> call(SearchReportParam params) async {
    return await reportRepository.searchReport(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchReportParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchReportParam(
      {required this.key, required this.time_from, required this.time_to});
}

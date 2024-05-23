import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/report_repositories.dart';

class DeleteReport implements UseCase<String, DeleteReportParams> {
  final ReportRepository reportRepository;

  DeleteReport({required this.reportRepository});

  @override
  Future<Either<Failure, String>> call(DeleteReportParams params) async {
    return await reportRepository.deleteReport(params.ReportId);
  }
}

class DeleteReportParams {
  final int ReportId;
  DeleteReportParams({required this.ReportId});
}

import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/reports.dart';

abstract interface class ReportRepository {
  Future<Either<Failure, String>> deleteReport(int ReportId);
  Future<Either<Failure, List<Report>>> getAllReport();
  Future<Either<Failure, List<Report>>> searchReport({
    String? key,
    String? time_from,
    String? time_to,
  });
}

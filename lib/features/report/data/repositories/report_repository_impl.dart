import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/report_repositories.dart';
import '../datasources/report_remote_data_source.dart';
import '../modles/report_model.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource reportRemoteDataSource;

  ReportRepositoryImpl({required this.reportRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteReport(int ReportId) async {
    try {
      final message =
          await reportRemoteDataSource.deleteReport(ReportId: ReportId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReportModel>>> getAllReport() async {
    try {
      final Reports = await reportRemoteDataSource.getAllReports();
      return right(Reports);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReportModel>>> searchReport(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final Reports = await reportRemoteDataSource.searchReport(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(Reports);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

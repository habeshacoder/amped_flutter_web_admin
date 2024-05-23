// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';
import '../../domain/entities/reports.dart';
import '../../domain/usecases/delete_report.dart';
import '../../domain/usecases/get_all_report.dart';
import '../../domain/usecases/search_report.dart';
part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final GetAllReports _getAllReports;
  final SearchReport _searchReport;
  final DeleteReport _deleteReport;

  ReportBloc(
      {required GetAllReports getAllReports,
      required DeleteReport deleteReport,
      required SearchReport searchReport})
      : _getAllReports = getAllReports,
        _deleteReport = deleteReport,
        _searchReport = searchReport,
        super(ReportInitial()) {
    on<ReportEvent>((event, emit) => emit(ReportLoading()));
    on<GetAllReportsEvent>(_onReportFetchEvent);
    on<DeleteReportsEvent>(_onDeleteReportEvent);
    on<SearchReportEvent>(_onSearchReportEvent);
  }

  void _onReportFetchEvent(
    GetAllReportsEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(ReportLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllReports.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ReportFailureState(failure.message)),
      (success) => emit(ReportsDisplaySuccessState(success)),
    );
  }

  void _onDeleteReportEvent(
    DeleteReportsEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(ReportLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res =
        await _deleteReport.call(DeleteReportParams(ReportId: event.ReportId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ReportFailureState(failure.message)),
      (success) => emit(ReportDeleteSuccessState(message: success)),
    );
  }

  void _onSearchReportEvent(
    SearchReportEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(ReportLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchReport.call(SearchReportParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(ReportFailureState(failure.message)),
      (success) => emit(SearchReportSuccessState(Reports: success)),
    );
  }
}

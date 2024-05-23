part of 'report_bloc.dart';

sealed class ReportEvent {}

final class ReportsDeleteEvent extends ReportEvent {
  final String ReportId;
  ReportsDeleteEvent({required this.ReportId});
}

final class GetAllReportsEvent extends ReportEvent {}

final class DeleteReportsEvent extends ReportEvent {
  final int ReportId;

  DeleteReportsEvent({required this.ReportId});
}

final class SearchReportEvent extends ReportEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchReportEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}

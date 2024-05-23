part of 'report_bloc.dart';

sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportFailureState extends ReportState {
  final String error;
  ReportFailureState(this.error);
}

final class ReportDeleteSuccessState extends ReportState {
  final String message;

  ReportDeleteSuccessState({required this.message});
}

final class ReportsDisplaySuccessState extends ReportState {
  final List<Report> Reports;

  ReportsDisplaySuccessState(this.Reports);
}

final class SearchReportSuccessState extends ReportState {
  final List<Report> Reports;

  SearchReportSuccessState({required this.Reports});
}

import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../modles/report_model.dart';

abstract interface class ReportRemoteDataSource {
  Future<List<ReportModel>> getAllReports();
  Future<String> deleteReport({required int ReportId});
  Future<List<ReportModel>> searchReport({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteReport({required int ReportId}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteReportsUrl}/$ReportId'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: json.encode({"ReportId": ReportId}));
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all Reports
  @override
  Future<List<ReportModel>> getAllReports() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllReportsUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<ReportModel> Reports = [];
      extracted.forEach((mat) {
        print('Report from remotedatasource:---------------$Reports');

        Reports.add(ReportModel.fromJson(mat));
      });
      return Reports;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<ReportModel>> searchReport(
      {String? key, String? time_from, String? time_to}) async {
    final response = await http.post(Uri.parse('${Urls.searchReportsUrl}'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "key": key,
          "time_from": time_from,
          "time_to": time_to,
        }));
    List<ReportModel> searchedReports = [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedReports);
        searchedReports.add(ReportModel.fromJson(channel));
      });
      return searchedReports;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

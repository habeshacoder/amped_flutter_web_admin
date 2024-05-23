import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/rate_model.dart';

abstract interface class RateRemoteDataSource {
  Future<List<RateModel>> getAllRates();
  Future<String> deleteRate({required int RateId});
  Future<List<RateModel>> searchRate({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class RateRemoteDataSourceImpl implements RateRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteRate({required int RateId}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteRatesUrl}/$RateId'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: json.encode({"RateId": RateId}));
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all Rates
  @override
  Future<List<RateModel>> getAllRates() async {
    try {
      final response = await http.get(Uri.parse(Urls.getallRatesUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<RateModel> Rates = [];
      extracted.forEach((mat) {
        print('Rate from remotedatasource:---------------$Rates');

        Rates.add(RateModel.fromJson(mat));
      });
      return Rates;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<RateModel>> searchRate(
      {String? key, String? time_from, String? time_to}) async {
    final response = await http.post(Uri.parse('${Urls.searchRatesUrl}'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "key": key,
          "time_from": time_from,
          "time_to": time_to,
        }));
    List<RateModel> searchedRates = [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedRates);
        searchedRates.add(RateModel.fromJson(channel));
      });
      return searchedRates;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

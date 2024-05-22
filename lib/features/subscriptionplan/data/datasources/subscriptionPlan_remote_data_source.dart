import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/subscriptionplan_model.dart';

abstract interface class SubscriptionPlanRemoteDataSource {
  Future<List<SubscriptionPlanModel>> getAllSubscriptionPlans();
  Future<String> deleteSubscriptionPlan({required int name});
  Future<List<SubscriptionPlanModel>> searchSubscriptionPlan({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class SubscriptionPlanRemoteDataSourceImpl
    implements SubscriptionPlanRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteSubscriptionPlan({required int name}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteSubscriptionPlanUrl}/$name'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: json.encode({"name": name}));
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all SubscriptionPlans
  @override
  Future<List<SubscriptionPlanModel>> getAllSubscriptionPlans() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllSubscriptionPlanUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<SubscriptionPlanModel> SubscriptionPlans = [];
      extracted.forEach((mat) {
        print(
            'SubscriptionPlan from remotedatasource:---------------$SubscriptionPlans');

        SubscriptionPlans.add(SubscriptionPlanModel.fromJson(mat));
      });
      return SubscriptionPlans;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<SubscriptionPlanModel>> searchSubscriptionPlan(
      {String? key, String? time_from, String? time_to}) async {
    final response =
        await http.post(Uri.parse('${Urls.searchSubscriptionPlanUrl}'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode({
              "key": key,
              "time_from": time_from,
              "time_to": time_to,
            }));
    List<SubscriptionPlanModel> searchedSubscriptionPlans = [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedSubscriptionPlans);
        searchedSubscriptionPlans.add(SubscriptionPlanModel.fromJson(channel));
      });
      return searchedSubscriptionPlans;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

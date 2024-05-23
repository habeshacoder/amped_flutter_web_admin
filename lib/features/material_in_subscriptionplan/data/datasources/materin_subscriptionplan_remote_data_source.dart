import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/material_in_subscriptionplan_model.dart';

abstract interface class MaterialInSubscriptionPlanRemoteDataSource {
  Future<List<MaterialInSubscriptionPlanModel>>
      getAllMaterialInSubscriptionPlans();
  Future<String> deleteMaterialInSubscriptionPlan(
      {required int materialInSubscriptionPlanId});
  Future<List<MaterialInSubscriptionPlanModel>>
      searchMaterialInSubscriptionPlan({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class MaterialInSubscriptionPlanRemoteDataSourceImpl
    implements MaterialInSubscriptionPlanRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteMaterialInSubscriptionPlan(
      {required int materialInSubscriptionPlanId}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteMaterialInSubscriptionPlanUrl}'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: json.encode({"email": materialInSubscriptionPlanId}));
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all MaterialInSubscriptionPlans
  @override
  Future<List<MaterialInSubscriptionPlanModel>>
      getAllMaterialInSubscriptionPlans() async {
    try {
      final response = await http.get(
          Uri.parse(Urls.getMaterialInSubscriptionPlanUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<MaterialInSubscriptionPlanModel> MaterialInSubscriptionPlans = [];
      extracted.forEach((mat) {
        print(
            'MaterialInSubscriptionPlan from remotedatasource:---------------$MaterialInSubscriptionPlans');

        MaterialInSubscriptionPlans.add(
            MaterialInSubscriptionPlanModel.fromJson(mat));
      });
      return MaterialInSubscriptionPlans;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<MaterialInSubscriptionPlanModel>>
      searchMaterialInSubscriptionPlan(
          {String? key, String? time_from, String? time_to}) async {
    final response = await http.post(
        Uri.parse('${Urls.searchMaterialInSubscriptionPlanUrl}'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "key": key,
          "time_from": time_from,
          "time_to": time_to,
        }));
    List<MaterialInSubscriptionPlanModel> searchedMaterialInSubscriptionPlans =
        [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedMaterialInSubscriptionPlans);
        searchedMaterialInSubscriptionPlans
            .add(MaterialInSubscriptionPlanModel.fromJson(channel));
      });
      return searchedMaterialInSubscriptionPlans;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

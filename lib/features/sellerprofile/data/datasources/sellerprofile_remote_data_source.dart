import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/sellerprofile_model.dart';

abstract interface class SellerProfileRemoteDataSource {
  Future<List<SellerProfileModel>> getAllSellerProfiles();
  Future<String> deleteSellerProfile({required int SellerprofileId});
  Future<List<SellerProfileModel>> searchSellerProfile({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class SellerProfileRemoteDataSourceImpl
    implements SellerProfileRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteSellerProfile({required int SellerprofileId}) async {
    try {
      final response = await http.delete(
        Uri.parse('${Urls.deleteSelleProfilesUrl}/$SellerprofileId'),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all SellerProfiles
  @override
  Future<List<SellerProfileModel>> getAllSellerProfiles() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllSelleProfilesUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<SellerProfileModel> SellerProfiles = [];
      extracted.forEach((mat) {
        print(
            'SellerProfile from remotedatasource:---------------$SellerProfiles');

        SellerProfiles.add(SellerProfileModel.fromJson(mat));
      });
      return SellerProfiles;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<SellerProfileModel>> searchSellerProfile(
      {String? key, String? time_from, String? time_to}) async {
    final response =
        await http.post(Uri.parse('${Urls.searchSelleProfilesUrl}'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode({
              "key": key,
              "time_from": time_from,
              "time_to": time_to,
            }));
    print(response.body);
    List<SellerProfileModel> searchedSellerProfiles = [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedSellerProfiles);
        searchedSellerProfiles.add(SellerProfileModel.fromJson(channel));
      });
      return searchedSellerProfiles;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

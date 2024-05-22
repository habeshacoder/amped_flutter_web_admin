import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<List<ProfileModel>> getAllProfiles();
  Future<String> deleteProfile({required int profileId});
  Future<List<ProfileModel>> searchProfile({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteProfile({required int profileId}) async {
    try {
      final response = await http.delete(
        Uri.parse('${Urls.deleteProfilesUrl}/$profileId'),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all Profiles
  @override
  Future<List<ProfileModel>> getAllProfiles() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllProfilesUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<ProfileModel> Profiles = [];
      extracted.forEach((mat) {
        print('Profile from remotedatasource:---------------$Profiles');

        Profiles.add(ProfileModel.fromJson(mat));
      });
      return Profiles;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<ProfileModel>> searchProfile(
      {String? key, String? time_from, String? time_to}) async {
    final response = await http.post(Uri.parse('${Urls.searchProfilesUrl}'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "key": key,
          "time_from": time_from,
          "time_to": time_to,
        }));
    print(response.body);
    List<ProfileModel> searchedProfiles = [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedProfiles);
        searchedProfiles.add(ProfileModel.fromJson(channel));
      });
      return searchedProfiles;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

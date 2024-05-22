import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

abstract interface class UserRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<String> deleteUser({required String email});
  Future<List<UserModel>> searchUser({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteUser({required String email}) async {
    try {
      final response = await http.delete(Uri.parse('${Urls.deleteUserUrl}'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: json.encode({"email": email}));
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all Users
  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllUserUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<UserModel> Users = [];
      extracted.forEach((mat) {
        print('user from remotedatasource:---------------$Users');

        Users.add(UserModel.fromJson(mat));
      });
      return Users;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<UserModel>> searchUser(
      {String? key, String? time_from, String? time_to}) async {
    final response = await http.post(Uri.parse('${Urls.searchUserUrl}'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "key": key,
          "time_from": time_from,
          "time_to": time_to,
        }));
    List<UserModel> searchedUsers = [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedUsers);
        searchedUsers.add(UserModel.fromJson(channel));
      });
      return searchedUsers;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/channel_material_model.dart';

abstract interface class ChannelMaterialRemoteDataSource {
  Future<List<ChannelMaterialModel>> getAllChannelMaterials();
  Future<String> deleteChannelMaterial({required int ChannelmaterialId});
  Future<List<ChannelMaterialModel>> searchChannelMaterial({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class ChannelMaterialRemoteDataSourceImpl
    implements ChannelMaterialRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteChannelMaterial({required int ChannelmaterialId}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteChannelMaterilaUrl}/$ChannelmaterialId'),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all Channelmaterials
  @override
  Future<List<ChannelMaterialModel>> getAllChannelMaterials() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllChannelMaterilaUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<ChannelMaterialModel> Channelmaterials = [];
      extracted.forEach((mat) {
        Channelmaterials.add(ChannelMaterialModel.fromJson(mat));
      });
      print('channel from remotedatasource:---------------$Channelmaterials');
      return Channelmaterials;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<ChannelMaterialModel>> searchChannelMaterial(
      {String? key, String? time_from, String? time_to}) async {
    final response =
        await http.post(Uri.parse('${Urls.searchChannelMaterilaUrl}'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode({
              "key": key,
              "time_from": time_from,
              "time_to": time_to,
            }));
    List<ChannelMaterialModel> searchedChannelMaterials = [];
    try {
      json.decode(response.body)["mainMatches"].forEach((channel) {
        searchedChannelMaterials.add(ChannelMaterialModel.fromJson(channel));
      });
      return searchedChannelMaterials;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

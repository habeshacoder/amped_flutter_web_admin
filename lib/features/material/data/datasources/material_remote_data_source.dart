import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import 'package:amped_media_admin/features/material/data/models/material_model.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

abstract interface class MaterialRemoteDataSource {
  Future<List<MaterialModel>> getAllMaterials();
  Future<String> deleteMaterial({required int materialId});
  Future<List<MaterialModel>> searchMaterial({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class MaterialRemoteDataSourceImpl implements MaterialRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteMaterial({required int materialId}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteMaterialUrl}/$materialId'),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all materials
  @override
  Future<List<MaterialModel>> getAllMaterials() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllMaterialUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<MaterialModel> materials = [];
      extracted.forEach((mat) {
        materials.add(MaterialModel.fromJson(mat));
      });
      print('channel from remotedatasource:---------------$materials');
      return materials;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<MaterialModel>> searchMaterial(
      {String? key, String? time_from, String? time_to}) async {
    final response = await http.post(Uri.parse('${Urls.searchMaterialUrl}'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "key": key,
          "time_from": time_from,
          "time_to": time_to,
        }));
    List<MaterialModel> searchedMaterials = [];
    try {
      json.decode(response.body)["mainMatches"].forEach((channel) {
        searchedMaterials.add(MaterialModel.fromJson(channel));
      });
      return searchedMaterials;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

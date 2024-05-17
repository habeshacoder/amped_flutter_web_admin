import 'dart:convert';
import 'dart:io';
import 'package:amped_media_admin/core/constants/backendurl.dart';
import 'package:amped_media_admin/viewmodels/materialmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class materialCreationProvider with ChangeNotifier {
  List<MaterialModel> _createdMaterials = [];
  int? newMaterialId;

  List<MaterialModel> get getCreatedChannels {
    return _createdMaterials;
  }

  //get  all materials
  Future<List<dynamic>> getMaterials() async {
    final baseUrl = BackEndUrl.url;
    final url = '$baseUrl/material';

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'});

    print('get all material body-----------------------${response.body}');
    List<MaterialModel> loadedMaterials = [];
    final extractedResponse = json.decode(response.body);

    print(
        'get all material body decoded-----------------------${extractedResponse}');

    return extractedResponse;
  }

  //get rates
  //get rates information
  Future<dynamic> getAvgRate(String? token, int material_id) async {
    // final auth = Auth();
    if (token == null) {
      print('token is null to do getme method...........');
      throw Exception('unauthorized access');
    }
    dynamic avgRate;

    final baseUrl = BackEndUrl.url;
    final url = '$baseUrl/rate/material/${material_id}';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
      );
      final extractedResponse = json.decode(response.body);

      print('after http.post called ...............${extractedResponse}');
      if (response.statusCode != 200 && response.statusCode != 201) {
        print('inside get rate.....');
        throw Exception('${extractedResponse['message']}');
      }

      avgRate = extractedResponse['rating'];

      print(avgRate);
    } catch (error) {
      print(error);
      throw error;
    }

    print('sample here');

    return avgRate;
  }
}

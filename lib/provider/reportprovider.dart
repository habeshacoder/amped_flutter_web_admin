import 'dart:convert';
import 'dart:io';
import 'package:amped_media_admin/core/constants/backendurl.dart';
import 'package:amped_media_admin/viewmodels/materialmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ReportProvider with ChangeNotifier {
  List<MaterialModel> _createdMaterials = [];
  int? newMaterialId;

  List<MaterialModel> get getCreatedChannels {
    return _createdMaterials;
  }

  //get  all materials
  Future<List<dynamic>> getReports() async {
    final baseUrl = BackEndUrl.url;
    final url = '$baseUrl/reports';

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'});

    print('get all material body-----------------------${response.body}');
    List<MaterialModel> loadedMaterials = [];
    final extractedResponse = json.decode(response.body);

    print(
        'get all material body decoded-----------------------${extractedResponse}');

    return extractedResponse;
  }
}

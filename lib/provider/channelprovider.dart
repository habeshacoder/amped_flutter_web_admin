import 'dart:convert';
import 'dart:io';
import 'package:amped_media_admin/core/constants/backendurl.dart';
import 'package:amped_media_admin/viewmodels/channelmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChannelCreationProvider with ChangeNotifier {
  List<ChannelModel> createdChannels = [];

  List<ChannelModel> get getCreatedChannels {
    return createdChannels;
  }

  //get all channels
  Future<List<dynamic>> seeAllChannel() async {
    final baseUrl = BackEndUrl.url;
    final url = '$baseUrl/channel';

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'});
    List<ChannelModel> loadedChannels = [];

    final extractedResponse = json.decode(response.body);
    // try {
    //   extractedResponse.forEach((mat) {
    //     loadedChannels.add(ChannelModel.fromJson(mat));
    //   });
    //   print(loadedChannels);
    // } catch (error) {
    //   print('eror......:${error}');
    // }

    return extractedResponse;
  }
}

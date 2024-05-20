import 'dart:convert';

import 'package:amped_media_admin/core/error/exceptions.dart';

import '../../../../core/constants/urls.dart';
import '../models/channelmodel.dart';
import 'package:http/http.dart' as http;

abstract interface class ChannelRemoteDataSource {
  Future<List<ChannelModel>> getAllChannels();
  Future<String> deleteChannel({required int channelId});
  Future<List<ChannelModel>> searchChannel({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class ChannelRemoteDataSourceImpl implements ChannelRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteChannel({required int channelId}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteChannelsUrl}/$channelId'),
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
  Future<List<ChannelModel>> getAllChannels() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllChannelsUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<ChannelModel> channels = [];
      extracted.forEach((mat) {
        channels.add(ChannelModel.fromJson(mat));
      });
      print('channel from remotedatasource:---------------$channels');
      return channels;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<ChannelModel>> searchChannel(
      {String? key, String? time_from, String? time_to}) async {
    final response =
        await http.post(Uri.parse('${Urls.BackEndUrl}/search/channel'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode({
              "key": key,
              "time_from": time_from,
              "time_to": time_to,
            }));
    List<ChannelModel> searchedChannels = [];
    try {
      json.decode(response.body)["mainMatches"].forEach((channel) {
        searchedChannels.add(ChannelModel.fromJson(channel, true));
      });
      return searchedChannels;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

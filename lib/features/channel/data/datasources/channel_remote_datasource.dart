import 'dart:convert';

import 'package:amped_media_admin/core/error/exceptions.dart';

import '../../../../core/constants/urls.dart';
import '../models/channelmodel.dart';
import 'package:http/http.dart' as http;

abstract interface class ChannelRemoteDataSource {
  Future<List<ChannelModel>> getAllChannels();
  Future<String> deleteChannel({required int channelId});
}

class ChannelRemoteDataSourceImpl implements ChannelRemoteDataSource {
  @override
  Future<String> deleteChannel({required int channelId}) {
    throw UnimplementedError();
  }

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
      return channels;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }
}

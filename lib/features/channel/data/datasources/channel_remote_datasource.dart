import 'dart:convert';

import 'package:amped_media_admin/core/error/exceptions.dart';

import '../../../../core/constants/backendurl.dart';
import '../models/channelmodel.dart';
import 'package:http/http.dart' as http;

abstract interface class ChannelRemoteDataSource {
  Future<ChannelModel> getAllChannels();
  Future<String> deleteChannel({required int channelId});
}

class ChannelRemoteDataSourceImpl implements ChannelRemoteDataSource {
  @override
  Future<String> deleteChannel({required int channelId}) {
    throw UnimplementedError();
  }

  @override
  Future<ChannelModel> getAllChannels() async {
    try {
      final channels = await http.get(Uri.parse(Urls.getAllChannelsUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      return (jsonDecode(channels.body))
          .map((channel) => ChannelModel.fromJson(channel))
          .toList();
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

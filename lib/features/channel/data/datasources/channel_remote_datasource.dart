import 'package:amped_media_admin/viewmodels/channelmodel.dart';

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
  Future<ChannelModel> getAllChannels() {
    throw UnimplementedError();
  }
}

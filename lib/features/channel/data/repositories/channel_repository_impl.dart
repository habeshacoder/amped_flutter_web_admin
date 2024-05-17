import 'package:amped_media_admin/core/error/failure.dart';
import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import 'package:amped_media_admin/features/channel/domain/repositories/channel_repositor.dart';
import 'package:fpdart/src/either.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  @override
  Future<Either<Failure, String>> deleteChannel(int channelId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Channel>>> getAllChannels() {
    try {} catch (error) {}
    throw UnimplementedError();
  }
}

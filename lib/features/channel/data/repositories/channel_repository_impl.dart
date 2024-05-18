import 'package:amped_media_admin/core/error/failure.dart';
import 'package:amped_media_admin/features/channel/data/models/channelmodel.dart';
import 'package:amped_media_admin/features/channel/domain/repositories/channel_repositor.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/channel_remote_datasource.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  final ChannelRemoteDataSource channelRemoteDataSource;

  ChannelRepositoryImpl({required this.channelRemoteDataSource});
  @override
  Future<Either<Failure, String>> deleteChannel(int channelId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ChannelModel>>> getAllChannels() async {
    try {
      final channels = await channelRemoteDataSource.getAllChannels();
      return right(channels);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class ChannelRepository {
  Future<Either<Failure, String>> deleteChannel(int channelId);
  Future<Either<Failure, List<Channel>>> getAllChannels();
  Future<Either<Failure, List<Channel>>> searchChannel({
    String? key,
    String? time_from,
    String? time_to,
  });
}

import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/channel_repositor.dart';

class GetAllChannels implements UseCase<List<Channel>, NoParams> {
  final ChannelRepository channelRepository;
  GetAllChannels(this.channelRepository);

  @override
  Future<Either<Failure, List<Channel>>> call(NoParams params) async {
    return await channelRepository.getAllChannels();
  }
}

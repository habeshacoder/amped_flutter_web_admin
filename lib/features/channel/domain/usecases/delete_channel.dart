import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/channel_repositor.dart';

class DeleteChannel implements UseCase<String, DeleteChannelParams> {
  final ChannelRepository channelRepository;

  DeleteChannel({required this.channelRepository});

  @override
  Future<Either<Failure, String>> call(DeleteChannelParams params) async {
    return await channelRepository.deleteChannel(params.channelId);
  }
}

class DeleteChannelParams {
  final int channelId;
  DeleteChannelParams({required this.channelId});
}

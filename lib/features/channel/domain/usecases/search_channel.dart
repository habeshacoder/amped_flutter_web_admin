import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/channel_repositor.dart';

class SearchChannel implements UseCase<List<Channel>, SearchChannelParam> {
  final ChannelRepository channelRepository;
  SearchChannel({required this.channelRepository});

  @override
  Future<Either<Failure, List<Channel>>> call(SearchChannelParam params) async {
    return await channelRepository.searchChannel(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchChannelParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchChannelParam(
      {required this.key, required this.time_from, required this.time_to});
}

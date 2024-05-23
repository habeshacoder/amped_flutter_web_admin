import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/replays.dart';
import '../repositories/replay_repositories.dart';

class SearchReplay implements UseCase<List<Replay>, SearchReplayParam> {
  final ReplayRepository replayRepository;
  SearchReplay({required this.replayRepository});

  @override
  Future<Either<Failure, List<Replay>>> call(SearchReplayParam params) async {
    return await replayRepository.searchReplay(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchReplayParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchReplayParam(
      {required this.key, required this.time_from, required this.time_to});
}

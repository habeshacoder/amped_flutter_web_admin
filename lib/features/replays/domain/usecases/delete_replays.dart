import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/replay_repositories.dart';

class DeleteReplay implements UseCase<String, DeleteReplayParams> {
  final ReplayRepository replayRepository;

  DeleteReplay({required this.replayRepository});

  @override
  Future<Either<Failure, String>> call(DeleteReplayParams params) async {
    return await replayRepository.deleteReplay(params.ReplayId);
  }
}

class DeleteReplayParams {
  final int ReplayId;
  DeleteReplayParams({required this.ReplayId});
}

import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/replays.dart';
import '../repositories/replay_repositories.dart';

class GetAllReplays implements UseCase<List<Replay>, NoParams> {
  final ReplayRepository replaysRepository;

  GetAllReplays({required this.replaysRepository});

  @override
  Future<Either<Failure, List<Replay>>> call(NoParams params) async {
    return await replaysRepository.getAllReplay();
  }
}

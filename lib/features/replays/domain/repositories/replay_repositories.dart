import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/replays.dart';

abstract interface class ReplayRepository {
  Future<Either<Failure, String>> deleteReplay(int ReplayId);
  Future<Either<Failure, List<Replay>>> getAllReplay();
  Future<Either<Failure, List<Replay>>> searchReplay({
    String? key,
    String? time_from,
    String? time_to,
  });
}

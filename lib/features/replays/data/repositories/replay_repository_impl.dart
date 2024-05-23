import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/replay_repositories.dart';
import '../datasources/subscriptionPlan_remote_data_source.dart';
import '../models/replay_model.dart';

class ReplayRepositoryImpl implements ReplayRepository {
  final ReplayRemoteDataSource replayRemoteDataSource;

  ReplayRepositoryImpl({required this.replayRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteReplay(int ReplayId) async {
    try {
      final message =
          await replayRemoteDataSource.deleteReplay(replayId: ReplayId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReplayModel>>> getAllReplay() async {
    try {
      final Replays = await replayRemoteDataSource.getAllReplays();
      return right(Replays);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReplayModel>>> searchReplay(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final Replays = await replayRemoteDataSource.searchReplay(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(Replays);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

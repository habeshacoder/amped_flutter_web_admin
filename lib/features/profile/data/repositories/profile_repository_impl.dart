import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../datasource/profile_remote_data_source.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteProfile(int profileId) async {
    try {
      final message =
          await profileRemoteDataSource.deleteProfile(profileId: profileId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProfileModel>>> getAllProfile() async {
    try {
      final Profiles = await profileRemoteDataSource.getAllProfiles();
      return right(Profiles);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProfileModel>>> searchProfile(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final Profiles = await profileRemoteDataSource.searchProfile(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(Profiles);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

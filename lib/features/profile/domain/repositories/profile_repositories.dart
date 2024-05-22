import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/profile.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, String>> deleteProfile(int ProfileId);
  Future<Either<Failure, List<Profile>>> getAllProfile();
  Future<Either<Failure, List<Profile>>> searchProfile({
    String? key,
    String? time_from,
    String? time_to,
  });
}

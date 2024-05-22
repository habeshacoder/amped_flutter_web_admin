import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/profile_repositories.dart';

class DeleteProfile implements UseCase<String, DeleteProfileParams> {
  final ProfileRepository profileRepository;

  DeleteProfile({required this.profileRepository});

  @override
  Future<Either<Failure, String>> call(DeleteProfileParams params) async {
    return await profileRepository.deleteProfile(params.ProfileId);
  }
}

class DeleteProfileParams {
  final int ProfileId;
  DeleteProfileParams({required this.ProfileId});
}

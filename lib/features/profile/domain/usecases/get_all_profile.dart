import 'package:amped_media_admin/features/profile/domain/entities/profile.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/profile_repositories.dart';

class GetAllProfiles implements UseCase<List<Profile>, NoParams> {
  final ProfileRepository profileRepository;

  GetAllProfiles({required this.profileRepository});

  @override
  Future<Either<Failure, List<Profile>>> call(NoParams params) async {
    return await profileRepository.getAllProfile();
  }
}

import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/profile.dart';
import '../repositories/profile_repositories.dart';

class SearchProfile implements UseCase<List<Profile>, SearchProfileParam> {
  final ProfileRepository profileRepository;
  SearchProfile({required this.profileRepository});

  @override
  Future<Either<Failure, List<Profile>>> call(SearchProfileParam params) async {
    return await profileRepository.searchProfile(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchProfileParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchProfileParam(
      {required this.key, required this.time_from, required this.time_to});
}

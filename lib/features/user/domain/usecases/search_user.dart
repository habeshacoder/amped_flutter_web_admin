import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class SearchUser implements UseCase<List<User>, SearchUserParam> {
  final UserRepository userRepository;
  SearchUser({required this.userRepository});

  @override
  Future<Either<Failure, List<User>>> call(SearchUserParam params) async {
    return await userRepository.searchUser(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchUserParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchUserParam(
      {required this.key, required this.time_from, required this.time_to});
}

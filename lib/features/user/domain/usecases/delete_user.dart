import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repositories.dart';

class DeleteUser implements UseCase<String, DeleteUserParams> {
  final UserRepository userRepository;

  DeleteUser({required this.userRepository});

  @override
  Future<Either<Failure, String>> call(DeleteUserParams params) async {
    return await userRepository.deleteUser(params.UserId);
  }
}

class DeleteUserParams {
  final String UserId;
  DeleteUserParams({required this.UserId});
}

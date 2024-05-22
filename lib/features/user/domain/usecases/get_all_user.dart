import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class GetAllUsers implements UseCase<List<User>, NoParams> {
  final UserRepository userRepository;

  GetAllUsers({required this.userRepository});

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await userRepository.getAllUser();
  }
}

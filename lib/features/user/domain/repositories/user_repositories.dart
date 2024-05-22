import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract interface class UserRepository {
  Future<Either<Failure, String>> deleteUser(String UserId);
  Future<Either<Failure, List<User>>> getAllUser();
  Future<Either<Failure, List<User>>> searchUser({
    String? key,
    String? time_from,
    String? time_to,
  });
}

import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/user_repositories.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteUser(String UserId) async {
    try {
      final message = await userRemoteDataSource.deleteUser(email: UserId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getAllUser() async {
    try {
      final Users = await userRemoteDataSource.getAllUsers();
      return right(Users);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> searchUser(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final users = await userRemoteDataSource.searchUser(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(users);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/sellerprofile_repositories.dart';
import '../datasources/sellerprofile_remote_data_source.dart';
import '../models/sellerprofile_model.dart';

class SellerProfileRepositoryImpl implements SellerProfileRepository {
  final SellerProfileRemoteDataSource sellerprofileRemoteDataSource;

  SellerProfileRepositoryImpl({required this.sellerprofileRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteSellerProfile(
      int SellerprofileId) async {
    try {
      final message = await sellerprofileRemoteDataSource.deleteSellerProfile(
          SellerprofileId: SellerprofileId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SellerProfileModel>>>
      getAllSellerProfile() async {
    try {
      final SellerProfiles =
          await sellerprofileRemoteDataSource.getAllSellerProfiles();
      return right(SellerProfiles);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SellerProfileModel>>> searchSellerProfile(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final SellerProfiles =
          await sellerprofileRemoteDataSource.searchSellerProfile(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );

      return right(SellerProfiles);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/sellerprofile.dart';

abstract interface class SellerProfileRepository {
  Future<Either<Failure, String>> deleteSellerProfile(int SellerProfileId);
  Future<Either<Failure, List<SellerProfile>>> getAllSellerProfile();
  Future<Either<Failure, List<SellerProfile>>> searchSellerProfile({
    String? key,
    String? time_from,
    String? time_to,
  });
}

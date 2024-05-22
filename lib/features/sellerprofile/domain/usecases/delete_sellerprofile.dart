import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/sellerprofile_repositories.dart';

class DeleteSellerProfile
    implements UseCase<String, DeleteSellerProfileParams> {
  final SellerProfileRepository sellerprofileRepository;

  DeleteSellerProfile({required this.sellerprofileRepository});

  @override
  Future<Either<Failure, String>> call(DeleteSellerProfileParams params) async {
    return await sellerprofileRepository
        .deleteSellerProfile(params.SellerProfileId);
  }
}

class DeleteSellerProfileParams {
  final int SellerProfileId;
  DeleteSellerProfileParams({required this.SellerProfileId});
}

import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/sellerprofile.dart';
import '../repositories/sellerprofile_repositories.dart';

class GetAllSellerProfiles implements UseCase<List<SellerProfile>, NoParams> {
  final SellerProfileRepository sellerprofileRepository;

  GetAllSellerProfiles({required this.sellerprofileRepository});

  @override
  Future<Either<Failure, List<SellerProfile>>> call(NoParams params) async {
    return await sellerprofileRepository.getAllSellerProfile();
  }
}

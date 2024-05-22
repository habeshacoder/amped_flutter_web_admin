import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/sellerprofile.dart';
import '../repositories/sellerprofile_repositories.dart';

class SearchSellerProfile
    implements UseCase<List<SellerProfile>, SearchSellerProfileParam> {
  final SellerProfileRepository sellerprofileRepository;
  SearchSellerProfile({required this.sellerprofileRepository});

  @override
  Future<Either<Failure, List<SellerProfile>>> call(
      SearchSellerProfileParam params) async {
    return await sellerprofileRepository.searchSellerProfile(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchSellerProfileParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchSellerProfileParam(
      {required this.key, required this.time_from, required this.time_to});
}

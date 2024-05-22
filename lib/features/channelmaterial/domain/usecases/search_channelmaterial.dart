import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/channelmaterial.dart';
import '../repositories/channelmaterial_repositories.dart';

class SearchChannelMaterial
    implements UseCase<List<ChannelMaterial>, SearchChannelMaterialParam> {
  final ChannelMaterialRepository channelmaterialRepository;
  SearchChannelMaterial({required this.channelmaterialRepository});

  @override
  Future<Either<Failure, List<ChannelMaterial>>> call(
      SearchChannelMaterialParam params) async {
    return await channelmaterialRepository.searchChannelMaterial(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchChannelMaterialParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchChannelMaterialParam(
      {required this.key, required this.time_from, required this.time_to});
}

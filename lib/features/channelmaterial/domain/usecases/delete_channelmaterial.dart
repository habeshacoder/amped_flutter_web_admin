import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/channelmaterial_repositories.dart';

class DeleteChannelMaterial
    implements UseCase<String, DeleteChannelMaterialParams> {
  final ChannelMaterialRepository channelmaterialRepository;

  DeleteChannelMaterial({required this.channelmaterialRepository});

  @override
  Future<Either<Failure, String>> call(
      DeleteChannelMaterialParams params) async {
    return await channelmaterialRepository
        .deleteChannelMaterial(params.ChannelmaterialId);
  }
}

class DeleteChannelMaterialParams {
  final int ChannelmaterialId;
  DeleteChannelMaterialParams({required this.ChannelmaterialId});
}

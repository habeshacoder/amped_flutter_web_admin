import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/channelmaterial.dart';
import '../repositories/channelmaterial_repositories.dart';

class GetAllChannelMaterials
    implements UseCase<List<ChannelMaterial>, NoParams> {
  final ChannelMaterialRepository channelmaterialRepository;

  GetAllChannelMaterials({required this.channelmaterialRepository});

  @override
  Future<Either<Failure, List<ChannelMaterial>>> call(NoParams params) async {
    return await channelmaterialRepository.getAllChannelMaterial();
  }
}

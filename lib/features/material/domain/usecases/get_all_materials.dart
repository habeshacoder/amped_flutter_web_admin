import 'package:amped_media_admin/features/material/domain/repositories/material_repositories.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/material.dart';

class GetAllMaterials implements UseCase<List<Material>, NoParams> {
  final MaterialRepository _materialRepository;

  GetAllMaterials(this._materialRepository);

  @override
  Future<Either<Failure, List<Material>>> call(NoParams params) async {
    return await _materialRepository.getAllMaterial();
  }
}

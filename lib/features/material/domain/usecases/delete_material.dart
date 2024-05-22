import 'package:amped_media_admin/features/material/domain/repositories/material_repositories.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteMaterial implements UseCase<String, DeleteMaterialParams> {
  final MaterialRepository materialRepository;

  DeleteMaterial({required this.materialRepository});

  @override
  Future<Either<Failure, String>> call(DeleteMaterialParams params) async {
    return await materialRepository.deleteMaterial(params.materialId);
  }
}

class DeleteMaterialParams {
  final int materialId;
  DeleteMaterialParams({required this.materialId});
}

import 'package:amped_media_admin/features/material/domain/entities/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class MaterialRepository {
  Future<Either<Failure, String>> deleteMaterial(int materialId);
  Future<Either<Failure, List<Material>>> getAllMaterial();
  Future<Either<Failure, List<Material>>> searchMaterial({
    String? key,
    String? time_from,
    String? time_to,
  });
}

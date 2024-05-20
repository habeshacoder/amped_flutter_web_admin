import 'package:amped_media_admin/features/material/domain/entities/material.dart';
import 'package:amped_media_admin/features/material/domain/repositories/material_repositories.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class SearchMaterial implements UseCase<List<Material>, SearchMaterialParam> {
  final MaterialRepository materialRepository;
  SearchMaterial({required this.materialRepository});

  @override
  Future<Either<Failure, List<Material>>> call(
      SearchMaterialParam params) async {
    return await materialRepository.searchMaterial(
      key: params.key,
      time_from: params.time_from,
      time_to: params.time_to,
    );
  }
}

class SearchMaterialParam {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchMaterialParam(
      {required this.key, required this.time_from, required this.time_to});
}

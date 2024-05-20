import 'package:amped_media_admin/core/error/failure.dart';
import 'package:amped_media_admin/features/material/data/datasources/material_remote_data_source.dart';
import 'package:amped_media_admin/features/material/data/models/material_model.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/material_repositories.dart';

class MaterialRepositoryImpl implements MaterialRepository {
  final MaterialRemoteDataSource materialRemoteDataSource;

  MaterialRepositoryImpl({required this.materialRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteMaterial(int materialId) async {
    try {
      final message =
          await materialRemoteDataSource.deleteMaterial(materialId: materialId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MaterialModel>>> getAllMaterial() async {
    try {
      final materials = await materialRemoteDataSource.getAllMaterials();
      return right(materials);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MaterialModel>>> searchMaterial(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final materials = await materialRemoteDataSource.searchMaterial(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );
      return right(materials);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

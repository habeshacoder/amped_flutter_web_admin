import 'package:amped_media_admin/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/channelmaterial_repositories.dart';
import '../datasources/channelmaterial_remote_data_source.dart';
import '../models/channel_material_model.dart';

class ChannelMaterialRepositoryImpl implements ChannelMaterialRepository {
  final ChannelMaterialRemoteDataSource channelmaterialRemoteDataSource;

  ChannelMaterialRepositoryImpl(
      {required this.channelmaterialRemoteDataSource});

  @override
  Future<Either<Failure, String>> deleteChannelMaterial(
      int ChannelmaterialId) async {
    try {
      final message = await channelmaterialRemoteDataSource
          .deleteChannelMaterial(ChannelmaterialId: ChannelmaterialId);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChannelMaterialModel>>>
      getAllChannelMaterial() async {
    try {
      final Channelmaterials =
          await channelmaterialRemoteDataSource.getAllChannelMaterials();
      return right(Channelmaterials);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChannelMaterialModel>>> searchChannelMaterial(
      {String? key, String? time_from, String? time_to}) async {
    try {
      final Channelmaterials =
          await channelmaterialRemoteDataSource.searchChannelMaterial(
        key: key,
        time_from: time_from,
        time_to: time_to,
      );
      return right(Channelmaterials);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}

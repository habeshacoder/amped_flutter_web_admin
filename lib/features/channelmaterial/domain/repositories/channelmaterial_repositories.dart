import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/channelmaterial.dart';

abstract interface class ChannelMaterialRepository {
  Future<Either<Failure, String>> deleteChannelMaterial(int ChannelmaterialId);
  Future<Either<Failure, List<ChannelMaterial>>> getAllChannelMaterial();
  Future<Either<Failure, List<ChannelMaterial>>> searchChannelMaterial({
    String? key,
    String? time_from,
    String? time_to,
  });
}

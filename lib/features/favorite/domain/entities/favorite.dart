import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../user/domain/entities/user.dart';

class Favorite {
  final int? id;
  final String? userId;
  final int? materialId;
  final int? channelId;
  final int? channelMaterialId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Channel? channel;
  final ChannelMaterial? channelMaterial;
  final Material? material;
  final User? user;

  Favorite({
    required this.id,
    required this.userId,
    this.materialId,
    this.channelId,
    this.channelMaterialId,
    required this.createdAt,
    required this.updatedAt,
    this.channel,
    this.channelMaterial,
    this.material,
    required this.user,
  });
}

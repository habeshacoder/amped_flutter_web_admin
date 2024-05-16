import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../replays/domain/entities/replays.dart';
import '../../../user/domain/entities/user.dart';

class Rate {
  final int id;
  final String userId;
  final double rating;
  final String remark;
  final int? materialId;
  final int? channelId;
  final int? channelMaterialId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Channel? channel;
  final ChannelMaterial? channelMaterial;
  final Material? material;
  final User user;
  final List<Replay> replay;

  Rate({
    required this.id,
    required this.userId,
    required this.rating,
    required this.remark,
    this.materialId,
    this.channelId,
    this.channelMaterialId,
    required this.createdAt,
    required this.updatedAt,
    this.channel,
    this.channelMaterial,
    this.material,
    required this.user,
    required this.replay,
  });
}

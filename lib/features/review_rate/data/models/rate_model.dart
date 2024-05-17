// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/review_rate/domain/entities/rate.dart';

import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../replays/domain/entities/replays.dart';
import '../../../user/domain/entities/user.dart';

class RateModel extends Rate {
  RateModel({
    required super.id,
    required super.userId,
    required super.rating,
    required super.remark,
    super.materialId,
    super.channelId,
    super.channelMaterialId,
    required super.createdAt,
    required super.updatedAt,
    super.channel,
    super.channelMaterial,
    super.material,
    required super.user,
    required super.replay,
  });

  factory RateModel.fromMap(Map<String, dynamic> map) {
    return RateModel(
      id: map['id'] as int,
      userId: map['userId'] as String,
      rating: map['rating'] as double,
      remark: map['remark'] as String,
      materialId: map['materialId'] != null ? map['materialId'] as int : null,
      channelId: map['channelId'] != null ? map['channelId'] as int : null,
      channelMaterialId: map['channelMaterialId'] != null
          ? map['channelMaterialId'] as int
          : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      channel: map['channel'] != null
          ? Channel.fromMap(map['channel'] as Map<String, dynamic>)
          : null,
      channelMaterial: map['channelMaterial'] != null
          ? ChannelMaterial.fromMap(
              map['channelMaterial'] as Map<String, dynamic>)
          : null,
      material: map['material'] != null
          ? Material.fromMap(map['material'] as Map<String, dynamic>)
          : null,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      replay: List<Replay>.from(
        (map['replay'] as List<int>).map<Replay>(
          (x) => Replay.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory RateModel.fromJson(String source) =>
      RateModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

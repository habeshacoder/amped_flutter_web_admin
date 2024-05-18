// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channel/data/models/channelmodel.dart';
import 'package:amped_media_admin/features/channelmaterial/data/models/channel_material_model.dart';
import 'package:amped_media_admin/features/material/data/models/material_model.dart';
import 'package:amped_media_admin/features/replays/data/models/replay_model.dart';
import 'package:amped_media_admin/features/review_rate/domain/entities/rate.dart';
import 'package:amped_media_admin/features/user/data/models/user_model.dart';
import '../../../replays/domain/entities/replays.dart';

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
      id: map['id'],
      userId: map['userId'],
      rating: map['rating'],
      remark: map['remark'],
      materialId: map['materialId'],
      channelId: map['channelId'],
      channelMaterialId: map['channelMaterialId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channel: map['channel'] != null || map['channel'] != []
          ? ChannelModel.fromMap(map['channel'])
          : null,
      channelMaterial:
          map['channelMaterial'] != null || map['channelMaterial'] != []
              ? ChannelMaterialModel.fromMap(map['channelMaterial'])
              : null,
      material: map['material'] != null || map['material'] != []
          ? MaterialModel.fromMap(map['material'])
          : null,
      user: map['user'] != null || map['user'] != []
          ? UserModel.fromMap(map['user'])
          : null,
      replay: map['replay'] != null || map['replay'] != []
          ? List<Replay>.from(
              (map['replay']).map<Replay>(
                (x) => ReplayModel.fromMap(x),
              ),
            )
          : [],
    );
  }

  factory RateModel.fromJson(Map<String, dynamic> source) =>
      RateModel.fromMap(source);
}

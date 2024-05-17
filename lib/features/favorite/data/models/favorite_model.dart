// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channel/data/models/channelmodel.dart';
import 'package:amped_media_admin/features/channelmaterial/data/models/channel_material_model.dart';
import 'package:amped_media_admin/features/favorite/domain/entities/favorite.dart';
import 'package:amped_media_admin/features/material/data/models/material_model.dart';
import 'package:amped_media_admin/features/user/data/models/user_model.dart';

class FavoriteModel extends Favorite {
  FavoriteModel({
    required super.id,
    required super.userId,
    super.materialId,
    super.channelId,
    super.channelMaterialId,
    required super.createdAt,
    required super.updatedAt,
    super.channel,
    super.channelMaterial,
    super.material,
    required super.user,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'] as int,
      userId: map['userId'] as String,
      materialId: map['materialId'] != null ? map['materialId'] as int : null,
      channelId: map['channelId'] != null ? map['channelId'] as int : null,
      channelMaterialId: map['channelMaterialId'] != null
          ? map['channelMaterialId'] as int
          : null,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channel: map['channel'] != null
          ? ChannelModel.fromMap(map['channel'] as Map<String, dynamic>)
          : null,
      channelMaterial: map['channelMaterial'] != null
          ? ChannelMaterialModel.fromMap(
              map['channelMaterial'] as Map<String, dynamic>)
          : null,
      material: map['material'] != null
          ? MaterialModel.fromMap(map['material'] as Map<String, dynamic>)
          : null,
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

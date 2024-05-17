// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/favorite/domain/entities/favorite.dart';
import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../user/domain/entities/user.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'materialId': materialId,
      'channelId': channelId,
      'channelMaterialId': channelMaterialId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'channel': channel?.toMap(),
      'channelMaterial': channelMaterial?.toMap(),
      'material': material?.toMap(),
      'user': user.toMap(),
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'] as int,
      userId: map['userId'] as String,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

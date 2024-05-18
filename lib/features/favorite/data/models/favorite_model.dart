// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      id: map['id'],
      userId: map['userId'],
      materialId: map['materialId'],
      channelId: map['channelId'],
      channelMaterialId: map['channelMaterialId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channel: ChannelModel.fromMap(map['channel']),
      channelMaterial: ChannelMaterialModel.fromMap(map['channelMaterial']),
      material: MaterialModel.fromMap(map['material']),
      user: UserModel.fromMap(map['user']),
    );
  }

  factory FavoriteModel.fromJson(dynamic source) =>
      FavoriteModel.fromMap(source);
}

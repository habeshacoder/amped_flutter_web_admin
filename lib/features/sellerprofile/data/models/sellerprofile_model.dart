// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/core/utils/enums.dart';
import 'package:amped_media_admin/features/channel/data/models/channelmodel.dart';
import 'package:amped_media_admin/features/channelmaterial/data/models/channel_material_model.dart';
import 'package:amped_media_admin/features/material/data/models/material_model.dart';
import 'package:amped_media_admin/features/sellerprofile/domain/entities/sellerprofile.dart';
import 'package:amped_media_admin/features/user/data/models/user_model.dart';

import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../user/domain/entities/user.dart';

class SellerProfileModel extends SellerProfile {
  SellerProfileModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.sex,
    super.dateOfBirth,
    super.description,
    super.image,
    super.coverImage,
    required super.createdAt,
    required super.updatedAt,
    required super.channelMaterials,
    required super.channels,
    required super.materials,
    required super.user,
    // required this.socialLinksProfiles,
  });

  factory SellerProfileModel.fromMap(Map<String, dynamic> map) {
    return SellerProfileModel(
      id: map['id'] as int,
      userId: map['userId'] as String,
      name: map['name'] as String,
      sex: map['sex'],
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      coverImage:
          map['coverImage'] != null ? map['coverImage'] as String : null,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channelMaterials: List<ChannelMaterial>.from(
        (map['channelMaterials'] as List<int>).map<ChannelMaterial>(
          (x) => ChannelMaterialModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      channels: List<Channel>.from(
        (map['channels'] as List<int>).map<Channel>(
          (x) => ChannelModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      materials: List<Material>.from(
        (map['materials'] as List<int>).map<Material>(
          (x) => MaterialModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  factory SellerProfileModel.fromJson(String source) =>
      SellerProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

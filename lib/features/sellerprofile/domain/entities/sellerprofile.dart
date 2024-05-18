import 'package:amped_media_admin/core/utils/enums.dart';

import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../user/domain/entities/user.dart';

class SellerProfile {
  final int? id;
  final String? userId;
  final String? name;
  final Sex? sex;
  final String? dateOfBirth;
  final String? description;
  final String? image;
  final String? coverImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ChannelMaterial>? channelMaterials;
  final List<Channel>? channels;
  final List<Material>? materials;
  final User? user;
  // final List<SocialLinksProfile> socialLinksProfiles;

  SellerProfile({
    required this.id,
    required this.userId,
    required this.name,
    required this.sex,
    this.dateOfBirth,
    this.description,
    this.image,
    this.coverImage,
    required this.createdAt,
    required this.updatedAt,
    required this.channelMaterials,
    required this.channels,
    required this.materials,
    required this.user,
    // required this.socialLinksProfiles,
  });
}

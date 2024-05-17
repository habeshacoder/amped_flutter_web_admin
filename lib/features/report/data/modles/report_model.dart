// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/report/domain/entities/reports.dart';

import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../user/domain/entities/user.dart';

enum ReportType { Unspecified, Spam, Inappropriate, Other }

class ReportModel extends Report {
  ReportModel({
    required super.id,
    required super.reportType,
    required super.reportDesc,
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

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      id: map['id'] as int,
      reportType: ReportType.fromMap(map['reportType'] as Map<String, dynamic>),
      reportDesc: map['reportDesc'] as String,
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

  factory ReportModel.fromJson(String source) =>
      ReportModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

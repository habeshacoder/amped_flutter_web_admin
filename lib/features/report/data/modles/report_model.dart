// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/channel/data/models/channelmodel.dart';
import 'package:amped_media_admin/features/channelmaterial/data/models/channel_material_model.dart';
import 'package:amped_media_admin/features/material/data/models/material_model.dart';
import 'package:amped_media_admin/features/report/domain/entities/reports.dart';
import 'package:amped_media_admin/features/user/data/models/user_model.dart';

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
      id: map['id'],
      reportType: map['reportType'],
      reportDesc: map['reportDesc'],
      userId: map['userId'],
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
    );
  }

  factory ReportModel.fromJson(Map<String, dynamic> source) =>
      ReportModel.fromMap(source);
}

import '../../../channel/domain/entities/channel.dart';
import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../material/domain/entities/material.dart';
import '../../../user/domain/entities/user.dart';

enum ReportType { Unspecified, Spam, Inappropriate, Other }

class Report {
  final int? id;
  final ReportType? reportType;
  final String? reportDesc;
  final String? userId;
  final int? materialId;
  final int? channelId;
  final int? channelMaterialId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Channel? channel;
  final ChannelMaterial? channelMaterial;
  final Material? material;
  final User? user;

  Report({
    required this.id,
    required this.reportType,
    required this.reportDesc,
    required this.userId,
    this.materialId,
    this.channelId,
    this.channelMaterialId,
    required this.createdAt,
    required this.updatedAt,
    this.channel,
    this.channelMaterial,
    this.material,
    required this.user,
  });
}

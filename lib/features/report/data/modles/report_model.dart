// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/report/domain/entities/reports.dart';

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
  });

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      id: map['id'],
      reportType: map['report_type'],
      reportDesc: map['report_desc'],
      userId: map['user_id'],
      materialId: map['material_id'],
      channelId: map['channel_id'],
      channelMaterialId: map['channelMaterial_id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory ReportModel.fromJson(Map<String, dynamic> source) =>
      ReportModel.fromMap(source);
}

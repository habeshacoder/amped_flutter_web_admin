enum ReportType { Unspecified, Spam, Inappropriate, Other }

class Report {
  final int? id;
  final String? reportType;
  final String? reportDesc;
  final String? userId;
  final int? materialId;
  final int? channelId;
  final int? channelMaterialId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
  });
}

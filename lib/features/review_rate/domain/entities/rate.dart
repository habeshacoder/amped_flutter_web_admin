class Rate {
  final int? id;
  final String? userId;
  final double? rating;
  final String? remark;
  final int? materialId;
  final int? channelId;
  final int? channelMaterialId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Rate({
    required this.id,
    required this.userId,
    required this.rating,
    required this.remark,
    this.materialId,
    this.channelId,
    this.channelMaterialId,
    required this.createdAt,
    required this.updatedAt,
  });
}

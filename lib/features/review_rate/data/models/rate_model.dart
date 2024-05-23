// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/review_rate/domain/entities/rate.dart';

class RateModel extends Rate {
  RateModel({
    required super.id,
    required super.userId,
    required super.rating,
    required super.remark,
    super.materialId,
    super.channelId,
    super.channelMaterialId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory RateModel.fromMap(Map<String, dynamic> map) {
    return RateModel(
      id: map['id'],
      userId: map['user_id'],
      rating: map['rating'],
      remark: map['remark'],
      materialId: map['material_id'],
      channelId: map['channel_id'],
      channelMaterialId: map['channel_material_id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory RateModel.fromJson(Map<String, dynamic> source) =>
      RateModel.fromMap(source);
}

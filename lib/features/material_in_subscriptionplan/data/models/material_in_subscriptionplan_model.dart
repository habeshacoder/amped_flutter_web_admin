// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/entities/material_in_subscriptionplan.dart';

class MaterialInSubscriptionPlanModel extends MaterialInSubscriptionPlan {
  MaterialInSubscriptionPlanModel({
    required super.id,
    required super.subscriptionPlanId,
    required super.channelMaterialId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory MaterialInSubscriptionPlanModel.fromMap(Map<String, dynamic> map) {
    return MaterialInSubscriptionPlanModel(
      id: map['id'],
      subscriptionPlanId: map['subscriptionPlan_id'],
      channelMaterialId: map['channelMaterial_id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory MaterialInSubscriptionPlanModel.fromJson(
          Map<String, dynamic> source) =>
      MaterialInSubscriptionPlanModel.fromMap(source);
}

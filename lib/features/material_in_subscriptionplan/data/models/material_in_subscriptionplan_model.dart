// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channelmaterial/data/models/channel_material_model.dart';
import 'package:amped_media_admin/features/subscriptionplan/data/models/subscriptionplan_model.dart';
import '../../domain/entities/material_in_subscriptionplan.dart';

class MaterialInSubscriptionPlanModel extends MaterialInSubscriptionPlan {
  MaterialInSubscriptionPlanModel({
    required super.id,
    required super.subscriptionPlanId,
    required super.channelMaterialId,
    required super.createdAt,
    required super.updatedAt,
    required super.channelMaterial,
    required super.subscriptionPlan,
  });

  factory MaterialInSubscriptionPlanModel.fromMap(Map<String, dynamic> map) {
    return MaterialInSubscriptionPlanModel(
      id: map['id'] as int,
      subscriptionPlanId: map['subscriptionPlanId'] as int,
      channelMaterialId: map['channelMaterialId'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channelMaterial: ChannelMaterialModel.fromMap(
          map['channelMaterial'] as Map<String, dynamic>),
      subscriptionPlan: SubscriptionPlanModel.fromMap(
          map['subscriptionPlan'] as Map<String, dynamic>),
    );
  }

  factory MaterialInSubscriptionPlanModel.fromJson(String source) =>
      MaterialInSubscriptionPlanModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

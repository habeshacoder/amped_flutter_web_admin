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
      id: map['id'],
      subscriptionPlanId: map['subscriptionPlanId'],
      channelMaterialId: map['channelMaterialId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channelMaterial: map['channelMaterial'] != null
          ? ChannelMaterialModel.fromMap(map['channelMaterial'])
          : null,
      subscriptionPlan: map['subscriptionPlan'] != null
          ? SubscriptionPlanModel.fromMap(map['subscriptionPlan'])
          : null,
    );
  }

  factory MaterialInSubscriptionPlanModel.fromJson(
          Map<String, dynamic> source) =>
      MaterialInSubscriptionPlanModel.fromMap(source);
}

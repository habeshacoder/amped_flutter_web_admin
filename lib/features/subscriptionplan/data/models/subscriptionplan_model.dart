// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/channel/data/models/channelmodel.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/data/models/material_in_subscriptionplan_model.dart';
import 'package:amped_media_admin/features/subscribeduser/data/models/subsribedusers_model.dart';
import 'package:amped_media_admin/features/subscriptionplan/domain/entities/subscriptionplan.dart';

import '../../../channel/domain/entities/channel.dart';
import '../../../material_in_subscriptionplan/domain/entities/material_in_subscriptionplan.dart';
import '../../../subscribeduser/domain/entities/subscribeduser.dart';

class SubscriptionPlanModel extends SubscriptionPlan {
  SubscriptionPlanModel({
    required super.id,
    required super.name,
    super.description,
    required super.price,
    required super.channelId,
    required super.createdAt,
    required super.updatedAt,
    required super.materialInSubscriptionPlan,
    required super.subscribedUsers,
    required super.channel,
  });

  factory SubscriptionPlanModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionPlanModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] as double,
      channelId: map['channelId'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      materialInSubscriptionPlan: List<MaterialInSubscriptionPlan>.from(
        (map['materialInSubscriptionPlan'] as List<int>)
            .map<MaterialInSubscriptionPlan>(
          (x) => MaterialInSubscriptionPlanModel.fromMap(
              x as Map<String, dynamic>),
        ),
      ),
      subscribedUsers: List<SubscribedUser>.from(
        (map['subscribedUsers'] as List<int>).map<SubscribedUser>(
          (x) => SubscribedUserModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      channel: ChannelModel.fromMap(map['channel'] as Map<String, dynamic>),
    );
  }

  factory SubscriptionPlanModel.fromJson(String source) =>
      SubscriptionPlanModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

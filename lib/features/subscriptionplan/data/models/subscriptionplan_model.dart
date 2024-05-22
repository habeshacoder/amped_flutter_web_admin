// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/subscriptionplan/domain/entities/subscriptionplan.dart';

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
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      channelId: map['channel_id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      materialInSubscriptionPlan: [],
      subscribedUsers: [],
      channel: null,
    );
  }

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> source) =>
      SubscriptionPlanModel.fromMap(source);
}

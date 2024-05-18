import '../../../channel/domain/entities/channel.dart';
import '../../../material_in_subscriptionplan/domain/entities/material_in_subscriptionplan.dart';
import '../../../subscribeduser/domain/entities/subscribeduser.dart';

class SubscriptionPlan {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final int? channelId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<MaterialInSubscriptionPlan>? materialInSubscriptionPlan;
  final List<SubscribedUser>? subscribedUsers;
  final Channel? channel;

  SubscriptionPlan({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.channelId,
    required this.createdAt,
    required this.updatedAt,
    required this.materialInSubscriptionPlan,
    required this.subscribedUsers,
    required this.channel,
  });
}

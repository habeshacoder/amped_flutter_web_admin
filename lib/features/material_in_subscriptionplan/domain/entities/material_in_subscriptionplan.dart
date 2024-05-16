import '../../../channelmaterial/domain/entities/channelmaterial.dart';
import '../../../subscriptionplan/domain/entities/subscriptionplan.dart';

class MaterialInSubscriptionPlan {
  final int id;
  final int subscriptionPlanId;
  final int channelMaterialId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ChannelMaterial channelMaterial;
  final SubscriptionPlan subscriptionPlan;

  MaterialInSubscriptionPlan({
    required this.id,
    required this.subscriptionPlanId,
    required this.channelMaterialId,
    required this.createdAt,
    required this.updatedAt,
    required this.channelMaterial,
    required this.subscriptionPlan,
  });
}

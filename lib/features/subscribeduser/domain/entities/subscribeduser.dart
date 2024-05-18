import '../../../subscriptionplan/domain/entities/subscriptionplan.dart';
import '../../../user/domain/entities/user.dart';

class SubscribedUser {
  final int? id;
  final String? userId;
  final int? subscriptionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SubscriptionPlan? subscriptionPlan;
  final User? user;

  SubscribedUser({
    required this.id,
    required this.userId,
    this.subscriptionId,
    required this.createdAt,
    required this.updatedAt,
    this.subscriptionPlan,
    required this.user,
  });
}

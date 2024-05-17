// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/subscribeduser/domain/entities/subscribeduser.dart';
import '../../../subscriptionplan/domain/entities/subscriptionplan.dart';
import '../../../user/domain/entities/user.dart';

class SubscribedUserModel extends SubscribedUser {
  SubscribedUserModel({
    required super.id,
    required super.userId,
    super.subscriptionId,
    required super.createdAt,
    required super.updatedAt,
    super.subscriptionPlan,
    required super.user,
  });

  factory SubscribedUserModel.fromMap(Map<String, dynamic> map) {
    return SubscribedUserModel(
      id: map['id'] as int,
      userId: map['userId'] as String,
      subscriptionId:
          map['subscriptionId'] != null ? map['subscriptionId'] as int : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      subscriptionPlan: map['subscriptionPlan'] != null
          ? SubscriptionPlan.fromMap(
              map['subscriptionPlan'] as Map<String, dynamic>)
          : null,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  factory SubscribedUserModel.fromJson(String source) =>
      SubscribedUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

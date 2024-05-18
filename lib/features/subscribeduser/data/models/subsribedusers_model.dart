// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/subscribeduser/domain/entities/subscribeduser.dart';
import 'package:amped_media_admin/features/subscriptionplan/data/models/subscriptionplan_model.dart';
import 'package:amped_media_admin/features/user/data/models/user_model.dart';

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
      id: map['id'],
      userId: map['userId'],
      subscriptionId: map['subscriptionId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      subscriptionPlan: map['subscriptionPlan'] != null
          ? SubscriptionPlanModel.fromMap(map['subscriptionPlan'])
          : null,
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
    );
  }

  factory SubscribedUserModel.fromJson(Map<String, dynamic> source) =>
      SubscribedUserModel.fromMap(source);
}

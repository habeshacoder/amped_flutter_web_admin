// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/profile/domain/entities/profile.dart';

import '../../../../core/utils/enums.dart';
import '../../../user/domain/entities/user.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required super.id,
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.sex,
    required super.dateOfBirth,
    super.profileImage,
    super.coverImage,
    required super.createdAt,
    required super.updatedAt,
    required super.user,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as int,
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      sex: Sex.fromMap(map['sex'] as Map<String, dynamic>),
      dateOfBirth: map['dateOfBirth'] as String,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
      coverImage:
          map['coverImage'] != null ? map['coverImage'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/profile/domain/entities/profile.dart';
import 'package:amped_media_admin/features/user/data/models/user_model.dart';

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
      id: map['id'],
      userId: map['userId'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      sex: map['sex'],
      dateOfBirth: map['dateOfBirth'],
      profileImage: map['profileImage'],
      coverImage: map['coverImage'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      user: UserModel.fromMap(map['user']),
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> source) =>
      ProfileModel.fromMap(source);
}

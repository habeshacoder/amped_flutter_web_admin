// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/profile/domain/entities/profile.dart';

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
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      userId: map['user_id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      sex: map['sex'],
      dateOfBirth: map['date_of_birth'],
      profileImage: map['profile_image'],
      coverImage: map['cover_image'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> source) =>
      ProfileModel.fromMap(source);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amped_media_admin/features/user/domain/entities/user.dart';

import '../../../materialuser/domain/entities/materialuser.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';
import '../../../subscribeduser/domain/entities/subscribeduser.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.email,
    super.phone,
    required super.password,
    required super.provider,
    required super.isVerified,
    required super.isActive,
    super.refreshToken,
    required super.createdAt,
    required super.updatedAt,
    // required super.favorites,
    required super.materialUsers,
    // required super.passwordResets,
    super.profiles,
    required super.rates,
    required super.reports,
    required super.sellerProfiles,
    required super.subscribedUsers,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] as String,
      provider: map['provider'] as String,
      isVerified: map['isVerified'] as bool,
      isActive: map['isActive'] as bool,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      materialUsers: List<MaterialUser>.from(
        (map['materialUsers'] as List<int>).map<MaterialUser>(
          (x) => MaterialUser.fromMap(x as Map<String, dynamic>),
        ),
      ),
      profiles: map['profiles'] != null
          ? Profile.fromMap(map['profiles'] as Map<String, dynamic>)
          : null,
      rates: List<Rate>.from(
        (map['rates'] as List<int>).map<Rate>(
          (x) => Rate.fromMap(x as Map<String, dynamic>),
        ),
      ),
      reports: List<Report>.from(
        (map['reports'] as List<int>).map<Report>(
          (x) => Report.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sellerProfiles: List<SellerProfile>.from(
        (map['sellerProfiles'] as List<int>).map<SellerProfile>(
          (x) => SellerProfile.fromMap(x as Map<String, dynamic>),
        ),
      ),
      subscribedUsers: List<SubscribedUser>.from(
        (map['subscribedUsers'] as List<int>).map<SubscribedUser>(
          (x) => SubscribedUser.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

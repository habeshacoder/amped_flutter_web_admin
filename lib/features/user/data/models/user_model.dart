// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/materialuser/data/models/material_user.dart';
import 'package:amped_media_admin/features/profile/data/models/profile_model.dart';
import 'package:amped_media_admin/features/report/data/modles/report_model.dart';
import 'package:amped_media_admin/features/review_rate/data/models/rate_model.dart';
import 'package:amped_media_admin/features/sellerprofile/data/models/sellerprofile_model.dart';
import 'package:amped_media_admin/features/subscribeduser/data/models/subsribedusers_model.dart';
import 'package:amped_media_admin/features/user/domain/entities/user.dart';

import '../../../materialuser/domain/entities/materialuser.dart';
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
      id: map['id'],
      username: map['username'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
      provider: map['provider'],
      isVerified: map['isVerified'],
      isActive: map['isActive'],
      refreshToken: map['refreshToken'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      materialUsers: map['materialUsers'] != null || map['materialUsers'] != []
          ? List<MaterialUser>.from(
              (map['materialUsers']).map<MaterialUser>(
                (x) => MaterialUserModel.fromMap(x),
              ),
            )
          : [],
      profiles: map['profiles'] != null
          ? ProfileModel.fromMap(map['profiles'])
          : null,
      rates: map['rates'] != null || map['rates'] != []
          ? List<Rate>.from(
              (map['rates']).map<Rate>(
                (x) => RateModel.fromMap(x),
              ),
            )
          : [],
      reports: map['reports'] != null || map['reports'] != []
          ? List<Report>.from(
              (map['reports']).map<Report>(
                (x) => ReportModel.fromMap(x),
              ),
            )
          : [],
      sellerProfiles:
          map['sellerProfiles'] != null || map['sellerProfiles'] != []
              ? List<SellerProfile>.from(
                  (map['sellerProfiles']).map<SellerProfile>(
                    (x) => SellerProfileModel.fromMap(x),
                  ),
                )
              : [],
      subscribedUsers:
          map['subscribedUsers'] != null || map['subscribedUsers'] != []
              ? List<SubscribedUser>.from(
                  (map['subscribedUsers']).map<SubscribedUser>(
                    (x) => SubscribedUserModel.fromMap(x),
                  ),
                )
              : [],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

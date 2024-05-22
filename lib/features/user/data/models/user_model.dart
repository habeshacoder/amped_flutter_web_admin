import 'package:amped_media_admin/features/sellerprofile/data/models/sellerprofile_model.dart';
import 'package:amped_media_admin/features/user/domain/entities/user.dart';
import '../../../profile/data/models/profile_model.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';

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
    super.profiles,
    required super.sellerProfiles,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
      provider: map['provider'],
      isVerified: map['is_verified'],
      isActive: map['is_active'],
      refreshToken: map['refreshToken'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      profiles: map['profiles'] != null && map['profiles'] != []
          ? ProfileModel.fromMap(map['profiles'])
          : null,
      sellerProfiles:
          map['seller_profile'] != null && map['seller_profile'] != []
              ? List<SellerProfile>.from(
                  (map['seller_profile']).map<SellerProfile>(
                    (x) => SellerProfileModel.fromMap(x),
                  ),
                )
              : [],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

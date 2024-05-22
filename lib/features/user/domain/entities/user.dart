import '../../../profile/domain/entities/profile.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';

class User {
  final String? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? password;
  final String? provider;
  final bool? isVerified;
  final bool? isActive;
  final String? refreshToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Profile? profiles;
  final List<SellerProfile>? sellerProfiles;
  // final CustomUser customUser;
  User({
    required this.id,
    required this.username,
    required this.email,
    this.phone,
    required this.password,
    required this.provider,
    required this.isVerified,
    required this.isActive,
    this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    this.profiles,
    required this.sellerProfiles,
  });
}

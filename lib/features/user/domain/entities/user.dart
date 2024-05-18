import '../../../materialuser/domain/entities/materialuser.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';
import '../../../subscribeduser/domain/entities/subscribeduser.dart';

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
  // final List<Favorite> favorites;
  final List<MaterialUser>? materialUsers;
  final Profile? profiles;
  final List<Rate>? rates;
  final List<Report>? reports;
  final List<SellerProfile>? sellerProfiles;
  final List<SubscribedUser>? subscribedUsers;

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
    // required this.favorites,
    required this.materialUsers,
    // required this.passwordResets,
    this.profiles,
    required this.rates,
    required this.reports,
    required this.sellerProfiles,
    required this.subscribedUsers,
  });
}

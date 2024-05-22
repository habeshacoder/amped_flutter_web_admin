class Profile {
  final int? id;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? sex;
  final String? dateOfBirth;
  final String? profileImage;
  final String? coverImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.sex,
    required this.dateOfBirth,
    this.profileImage,
    this.coverImage,
    required this.createdAt,
    required this.updatedAt,
  });
}

import '../../features/material/domain/entities/material.dart';
import '../../features/user/domain/entities/user.dart';

class MaterialUser {
  final int id;
  final String userId;
  final int materialId;
  final bool isPaid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Material material;
  final User user;

  MaterialUser({
    required this.id,
    required this.userId,
    required this.materialId,
    required this.isPaid,
    required this.createdAt,
    required this.updatedAt,
    required this.material,
    required this.user,
  });
}

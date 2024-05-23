import 'package:amped_media_admin/features/replays/domain/entities/replays.dart';

class ReplayModel extends Replay {
  ReplayModel({
    required super.id,
    required super.replay,
    required super.remarkId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ReplayModel.fromMap(Map<String, dynamic> map) {
    return ReplayModel(
      id: map['id'],
      replay: map['replay'],
      remarkId: map['remark_id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory ReplayModel.fromJson(Map<String, dynamic> source) =>
      ReplayModel.fromMap(source);
}

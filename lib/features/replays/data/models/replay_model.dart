// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/replays/domain/entities/replays.dart';
import 'package:amped_media_admin/features/review_rate/data/models/rate_model.dart';

class ReplayModel extends Replay {
  ReplayModel({
    required super.id,
    required super.replay,
    required super.remarkId,
    required super.createdAt,
    required super.updatedAt,
    required super.rate,
  });

  factory ReplayModel.fromMap(Map<String, dynamic> map) {
    return ReplayModel(
      id: map['id'] as int,
      replay: map['replay'] as String,
      remarkId: map['remarkId'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      rate: RateModel.fromMap(map['rate'] as Map<String, dynamic>),
    );
  }

  factory ReplayModel.fromJson(String source) =>
      ReplayModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
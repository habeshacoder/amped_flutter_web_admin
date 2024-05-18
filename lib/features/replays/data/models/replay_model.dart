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
      id: map['id'],
      replay: map['replay'],
      remarkId: map['remarkId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      rate: RateModel.fromMap(map['rate']),
    );
  }

  factory ReplayModel.fromJson(Map<String, dynamic> source) =>
      ReplayModel.fromMap(source);
}

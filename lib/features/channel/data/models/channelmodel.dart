// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import 'package:amped_media_admin/features/favorite/data/models/favorite_model.dart';
import 'package:amped_media_admin/features/report/data/modles/report_model.dart';
import 'package:amped_media_admin/features/review_rate/data/models/rate_model.dart';
import 'package:amped_media_admin/features/sellerprofile/data/models/sellerprofile_model.dart';
import 'package:amped_media_admin/features/subscriptionplan/data/models/subscriptionplan_model.dart';
import '../../../favorite/domain/entities/favorite.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../subscriptionplan/domain/entities/subscriptionplan.dart';

class ChannelModel extends Channel {
  ChannelModel({
    required super.id,
    required super.name,
    super.description,
    required super.draft,
    required super.sellerProfileId,
    required super.createdAt,
    required super.updatedAt,
    required super.channelImage,
    required super.channelPreview,
    required super.sellerProfile,
    required super.favorite,
    required super.rate,
    required super.report,
    required super.subscriptionPlan,
  });

  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      draft: map['draft'] as bool,
      sellerProfileId: map['sellerProfileId'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channelImage: map['channelImage'] != null
          ? List<ChannelImageModel>.from(
              (map['channelImage'] as List<dynamic>).map<ChannelImageModel>(
                (x) => ChannelImageModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      channelPreview: List<PreviewChannelModel>.from(
        (map['channelPreview'] as List<int>).map<PreviewChannelModel>(
          (x) => PreviewChannelModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sellerProfile: SellerProfileModel.fromMap(
          map['sellerProfile'] as Map<String, dynamic>),
      favorite: List<Favorite>.from(
        (map['favorite'] as List<int>).map<Favorite>(
          (x) => FavoriteModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      rate: List<Rate>.from(
        (map['rate'] as List<int>).map<Rate>(
          (x) => RateModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      report: List<Report>.from(
        (map['report'] as List<int>).map<Report>(
          (x) => ReportModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      subscriptionPlan: List<SubscriptionPlan>.from(
        (map['subscriptionPlan'] as List<int>).map<SubscriptionPlan>(
          (x) => SubscriptionPlanModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory ChannelModel.fromJson(Map<String, dynamic> source) =>
      ChannelModel.fromMap(source);
}

class ChannelImageModel extends ChannelImage {
  ChannelImageModel({
    required super.id,
    required super.image,
    required super.primary,
    required super.cover,
    required super.channelId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ChannelImageModel.fromMap(Map<String, dynamic> map) {
    return ChannelImageModel(
      id: map['id'] as int,
      image: map['image'] as String,
      primary: map['primary'] as bool,
      cover: map['cover'] as bool,
      channelId: map['channelId'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  factory ChannelImageModel.fromJson(Map<String, dynamic> source) =>
      ChannelImageModel.fromMap(source);
}

class PreviewChannelModel extends PreviewChannel {
  PreviewChannelModel({
    required super.id,
    required super.preview,
    required super.channelId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PreviewChannelModel.fromMap(Map<String, dynamic> map) {
    return PreviewChannelModel(
      id: map['id'] as int ?? 0,
      preview: map['preview'] as String ?? '',
      channelId: map['channelId'] as int ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  factory PreviewChannelModel.fromJson(Map<String, dynamic> source) =>
      PreviewChannelModel.fromMap(source);
}

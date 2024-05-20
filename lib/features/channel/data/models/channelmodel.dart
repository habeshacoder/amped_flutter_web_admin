// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import 'package:amped_media_admin/features/report/data/modles/report_model.dart';
import 'package:amped_media_admin/features/review_rate/data/models/rate_model.dart';
import 'package:amped_media_admin/features/sellerprofile/data/models/sellerprofile_model.dart';
import 'package:amped_media_admin/features/subscriptionplan/data/models/subscriptionplan_model.dart';
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
    required super.rate,
    required super.report,
    required super.subscriptionPlan,
  });

  factory ChannelModel.fromMap(Map<String, dynamic> map,
      [bool isFromSearch = false]) {
    return ChannelModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      draft: map['draft'],
      sellerProfileId: map['sellerProfile_id'], // Substituted key value
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      channelPreview: [],
      channelImage: map['channel_image'] != null
          ? List<ChannelImageModel>.from(
              (map['channel_image']).map<ChannelImageModel>(
                (x) => ChannelImageModel.fromMap(x),
              ),
            )
          : [],
      sellerProfile: map['SellerProfile'] != null
          ? SellerProfileModel.fromMap(
              map['SellerProfile']) // Substituted key value
          : null,
      rate: isFromSearch
          ? null
          : map['rate'] != null || map['rate'] != []
              ? List<Rate>.from(
                  (map['rate']).map<Rate>(
                    (x) => RateModel.fromMap(x),
                  ),
                )
              : [],
      report: isFromSearch
          ? null
          : map['report'] != null || map['report'] != []
              ? List<Report>.from(
                  (map['report']).map<Report>(
                    (x) => ReportModel.fromMap(x),
                  ),
                )
              : [],
      subscriptionPlan: isFromSearch
          ? null
          : map['subscription_plan'] != null || map['subscription_plan'] != []
              ? List<SubscriptionPlan>.from(
                  (map['subscription_plan']).map<SubscriptionPlan>(
                    (x) => SubscriptionPlanModel.fromMap(x),
                  ),
                )
              : [],
    );
  }

  factory ChannelModel.fromJson(Map<String, dynamic> source,
          [bool isFromSearch = false]) =>
      ChannelModel.fromMap(source, isFromSearch);
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
      id: map['id'],
      image: map['image'],
      primary: map['primary'],
      cover: map['cover'],
      channelId: map['channel_id'], // Substituted key value
      createdAt: DateTime.parse(map['created_at']), // Substituted key value
      updatedAt: DateTime.parse(map['updated_at']),
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
      id: map['id'],
      preview: map['preview'],
      channelId: map['channel_id'], // Substituted key value
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']), // Substituted key value
    );
  }
  factory PreviewChannelModel.fromJson(Map<String, dynamic> source) =>
      PreviewChannelModel.fromMap(source);
}

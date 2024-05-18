// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channelmaterial/domain/entities/channelmaterial.dart';
import 'package:amped_media_admin/features/favorite/data/models/favorite_model.dart';
import 'package:amped_media_admin/features/material_in_subscriptionplan/data/models/material_in_subscriptionplan_model.dart';
import 'package:amped_media_admin/features/report/data/modles/report_model.dart';
import 'package:amped_media_admin/features/review_rate/data/models/rate_model.dart';
import 'package:amped_media_admin/features/sellerprofile/data/models/sellerprofile_model.dart';

class ChannelMaterialModel extends ChannelMaterial {
  ChannelMaterialModel({
    required super.id,
    required super.sellerProfileId,
    required super.parent,
    required super.type,
    required super.genere,
    required super.catagory,
    super.author,
    super.reader,
    super.translator,
    super.lengthMinute,
    super.lengthPage,
    super.firstPublishedAt,
    super.language,
    super.publisher,
    super.episode,
    super.continuesFrom,
    required super.material,
    required super.title,
    super.description,
    required super.createdAt,
    required super.updatedAt,
    required super.channelMaterialImages,
    required super.channelMaterialPreviews,
    required super.sellerProfile,
    required super.favorites,
    required super.materialInSubscriptionPlans,
    required super.rates,
    required super.reports,
  });

  factory ChannelMaterialModel.fromMap(Map<String, dynamic> map) {
    return ChannelMaterialModel(
      id: map['id'],
      sellerProfileId: map['sellerProfileId'],
      parent: map['parent'],
      type: map['type'],
      genere: map['genere'],
      catagory: map['catagory'],
      author: map['author'],
      reader: map['reader'],
      translator: map['translator'],
      lengthMinute: map['lengthMinute'],
      lengthPage: map['lengthPage'],
      firstPublishedAt: map['firstPublishedAt'],
      language: map['language'],
      publisher: map['publisher'],
      episode: map['episode'],
      continuesFrom: map['continuesFrom'],
      material: map['material'],
      title: map['title'],
      description: map['description'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channelMaterialImages: map['channelMaterialImages'] != null ||
              map['channelMaterialImages'] != []
          ? List<ChannelMaterialImage>.from(
              (map['channelMaterialImages']).map<ChannelMaterialImage>(
                (x) => ChannelMaterialImageModel.fromMap(x),
              ),
            )
          : [],
      channelMaterialPreviews: map['channelMaterialPreviews'] != null ||
              map['channelMaterialPreviews'] != []
          ? List<ChannelPreviewMaterial>.from(
              (map['channelMaterialPreviews']).map<ChannelPreviewMaterial>(
                (x) => ChannelPreviewMaterialModel.fromMap(x),
              ),
            )
          : [],
      sellerProfile: SellerProfileModel.fromMap(map['sellerProfile']),
      favorites: map['favorites'] != null || map['favorites'] != []
          ? List<FavoriteModel>.from(
              (map['favorites']).map<FavoriteModel>(
                (x) => FavoriteModel.fromMap(x),
              ),
            )
          : [],
      materialInSubscriptionPlans: map['materialInSubscriptionPlans'] != null ||
              map['materialInSubscriptionPlans'] != []
          ? List<MaterialInSubscriptionPlanModel>.from(
              (map['materialInSubscriptionPlans'])
                  .map<MaterialInSubscriptionPlanModel>(
                (x) => MaterialInSubscriptionPlanModel.fromMap(x),
              ),
            )
          : [],
      rates: map['rates'] != null || map['rates'] != []
          ? List<RateModel>.from(
              (map['rates']).map<RateModel>(
                (x) => RateModel.fromMap(x),
              ),
            )
          : [],
      reports: map['reports'] != null || map['reports'] != []
          ? List<ReportModel>.from(
              (map['reports']).map<ReportModel>(
                (x) => ReportModel.fromMap(x),
              ),
            )
          : [],
    );
  }

  factory ChannelMaterialModel.fromJson(String source) =>
      ChannelMaterialModel.fromMap(json.decode(source));
}

class ChannelMaterialImageModel extends ChannelMaterialImage {
  ChannelMaterialImageModel({
    required super.id,
    required super.image,
    required super.primary,
    required super.cover,
    required super.channelMaterialId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ChannelMaterialImageModel.fromMap(Map<String, dynamic> map) {
    return ChannelMaterialImageModel(
      id: map['id'],
      image: map['image'],
      primary: map['primary'],
      cover: map['cover'],
      channelMaterialId: map['channelMaterialId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  factory ChannelMaterialImageModel.fromJson(String source) =>
      ChannelMaterialImageModel.fromMap(json.decode(source));
}

class ChannelPreviewMaterialModel extends ChannelPreviewMaterial {
  ChannelPreviewMaterialModel({
    required super.id,
    required super.preview,
    required super.channelMaterialId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ChannelPreviewMaterialModel.fromMap(Map<String, dynamic> map) {
    return ChannelPreviewMaterialModel(
      id: map['id'],
      preview: map['preview'],
      channelMaterialId: map['channelMaterialId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  factory ChannelPreviewMaterialModel.fromJson(source) =>
      ChannelPreviewMaterialModel.fromMap(source);
}

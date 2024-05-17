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
      id: map['id'] as int,
      sellerProfileId: map['sellerProfileId'] as int,
      parent: map['parent'],
      type: map['type'],
      genere: map['genere'],
      catagory: map['catagory'],
      author: map['author'] != null ? map['author'] as String : null,
      reader: map['reader'] != null ? map['reader'] as String : null,
      translator:
          map['translator'] != null ? map['translator'] as String : null,
      lengthMinute:
          map['lengthMinute'] != null ? map['lengthMinute'] as double : null,
      lengthPage:
          map['lengthPage'] != null ? map['lengthPage'] as double : null,
      firstPublishedAt: map['firstPublishedAt'] != null
          ? map['firstPublishedAt'] as String
          : null,
      language: map['language'] != null ? map['language'] as String : null,
      publisher: map['publisher'] != null ? map['publisher'] as String : null,
      episode: map['episode'] != null ? map['episode'] as int : null,
      continuesFrom:
          map['continuesFrom'] != null ? map['continuesFrom'] as int : null,
      material: map['material'] as String,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      channelMaterialImages: List<ChannelMaterialImage>.from(
        (map['channelMaterialImages'] as List<int>).map<ChannelMaterialImage>(
          (x) => ChannelMaterialImageModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      channelMaterialPreviews: List<ChannelPreviewMaterial>.from(
        (map['channelMaterialPreviews'] as List<int>)
            .map<ChannelPreviewMaterial>(
          (x) => ChannelPreviewMaterialModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sellerProfile: SellerProfileModel.fromMap(
          map['sellerProfile'] as Map<String, dynamic>),
      favorites: List<FavoriteModel>.from(
        (map['favorites'] as List<int>).map<FavoriteModel>(
          (x) => FavoriteModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      materialInSubscriptionPlans: List<MaterialInSubscriptionPlanModel>.from(
        (map['materialInSubscriptionPlans'] as List<int>)
            .map<MaterialInSubscriptionPlanModel>(
          (x) => MaterialInSubscriptionPlanModel.fromMap(
              x as Map<String, dynamic>),
        ),
      ),
      rates: List<RateModel>.from(
        (map['rates'] as List<int>).map<RateModel>(
          (x) => RateModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      reports: List<ReportModel>.from(
        (map['reports'] as List<int>).map<ReportModel>(
          (x) => ReportModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory ChannelMaterialModel.fromJson(String source) =>
      ChannelMaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);
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
      id: map['id'] as int,
      image: map['image'] as String,
      primary: map['primary'] as bool,
      cover: map['cover'] as bool,
      channelMaterialId: map['channelMaterialId'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  factory ChannelMaterialImageModel.fromJson(String source) =>
      ChannelMaterialImageModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
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
      id: map['id'] as int,
      preview: map['preview'] as String,
      channelMaterialId: map['channelMaterialId'] as int,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  factory ChannelPreviewMaterialModel.fromJson(String source) =>
      ChannelPreviewMaterialModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

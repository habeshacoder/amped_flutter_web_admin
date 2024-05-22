// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channelmaterial/domain/entities/channelmaterial.dart';

import '../../../material_in_subscriptionplan/data/models/material_in_subscriptionplan_model.dart';

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
    // required super.channelMaterialPreviews,
    // required super.sellerProfile,
    // required super.favorites,
    required super.materialInSubscriptionPlans,
    // required super.rates,
    // required super.reports,
  });

  factory ChannelMaterialModel.fromMap(Map<String, dynamic> map) {
    return ChannelMaterialModel(
      id: map['id'],
      sellerProfileId: map['sellerProfile_id'],
      parent: map['parent'],
      type: map['type'],
      genere: map['genere'],
      catagory: map['catagory'],
      author: map['author'],
      reader: map['reader'],
      translator: map['translator'],
      lengthMinute: map['length_minute'],
      lengthPage: map['length_page'],
      firstPublishedAt: map['first_published_at'],
      language: map['language'],
      publisher: map['publisher'],
      episode: map['episode'],
      continuesFrom: map['continues_from'],
      material: map['material'],
      title: map['title'],
      description: map['description'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      channelMaterialImages: map['channel_material_image'] != null &&
              map['channel_material_image'] != []
          ? List<ChannelMaterialImage>.from(
              (map['channel_material_image']).map<ChannelMaterialImage>(
                (x) => ChannelMaterialImageModel.fromMap(x),
              ),
            )
          : [],
      materialInSubscriptionPlans:
          map['material_in_subscription_plan'] != null &&
                  map['material_in_subscription_plan'] != []
              ? List<MaterialInSubscriptionPlanModel>.from(
                  (map['material_in_subscription_plan'])
                      .map<MaterialInSubscriptionPlanModel>(
                    (x) => MaterialInSubscriptionPlanModel.fromMap(x),
                  ),
                )
              : [],
    );
  }

  factory ChannelMaterialModel.fromJson(Map<String, dynamic> source) =>
      ChannelMaterialModel.fromMap(source);
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
      channelMaterialId: map['channel_material_id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory ChannelMaterialImageModel.fromJson(Map<String, dynamic> source) =>
      ChannelMaterialImageModel.fromMap(source);
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
      channelMaterialId: map['channel_material_id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory ChannelPreviewMaterialModel.fromJson(source) =>
      ChannelPreviewMaterialModel.fromMap(source);
}

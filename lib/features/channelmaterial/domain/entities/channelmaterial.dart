// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../core/utils/enums.dart';
import '../../../favorite/domain/entities/favorite.dart';
import '../../../material_in_subscriptionplan/domain/entities/material_in_subscriptionplan.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';

class ChannelMaterial {
  final int id;
  final int sellerProfileId;
  final Parent parent;
  final Type type;
  final Genere genere;
  final Catagory catagory;
  final String? author;
  final String? reader;
  final String? translator;
  final double? lengthMinute;
  final double? lengthPage;
  final String? firstPublishedAt;
  final String? language;
  final String? publisher;
  final int? episode;
  final int? continuesFrom;
  final String material;
  final String title;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ChannelMaterialImage> channelMaterialImages;
  final List<ChannelPreviewMaterial> channelMaterialPreviews;
  final SellerProfile sellerProfile;
  final List<Favorite> favorites;
  final List<MaterialInSubscriptionPlan> materialInSubscriptionPlans;
  final List<Rate> rates;
  final List<Report> reports;

  ChannelMaterial({
    required this.id,
    required this.sellerProfileId,
    required this.parent,
    required this.type,
    required this.genere,
    required this.catagory,
    this.author,
    this.reader,
    this.translator,
    this.lengthMinute,
    this.lengthPage,
    this.firstPublishedAt,
    this.language,
    this.publisher,
    this.episode,
    this.continuesFrom,
    required this.material,
    required this.title,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.channelMaterialImages,
    required this.channelMaterialPreviews,
    required this.sellerProfile,
    required this.favorites,
    required this.materialInSubscriptionPlans,
    required this.rates,
    required this.reports,
  });
}

class ChannelMaterialImage {
  final int id;
  final String image;
  final bool primary;
  final bool cover;
  final int channelMaterialId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChannelMaterialImage({
    required this.id,
    required this.image,
    required this.primary,
    required this.cover,
    required this.channelMaterialId,
    required this.createdAt,
    required this.updatedAt,
  });
}

class ChannelPreviewMaterial {
  final int id;
  final String preview;
  final int channelMaterialId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChannelPreviewMaterial({
    required this.id,
    required this.preview,
    required this.channelMaterialId,
    required this.createdAt,
    required this.updatedAt,
  });
}

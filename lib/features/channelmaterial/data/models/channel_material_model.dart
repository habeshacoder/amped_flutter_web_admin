// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channelmaterial/domain/entities/channelmaterial.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sellerProfileId': sellerProfileId,
      'parent': parent.toMap(),
      'type': type.toMap(),
      'genere': genere.toMap(),
      'catagory': catagory.toMap(),
      'author': author,
      'reader': reader,
      'translator': translator,
      'lengthMinute': lengthMinute,
      'lengthPage': lengthPage,
      'firstPublishedAt': firstPublishedAt,
      'language': language,
      'publisher': publisher,
      'episode': episode,
      'continuesFrom': continuesFrom,
      'material': material,
      'title': title,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'channelMaterialImages':
          channelMaterialImages.map((x) => x.toMap()).toList(),
      'channelMaterialPreviews':
          channelMaterialPreviews.map((x) => x.toMap()).toList(),
      'sellerProfile': sellerProfile.toMap(),
      'favorites': favorites.map((x) => x.toMap()).toList(),
      'materialInSubscriptionPlans':
          materialInSubscriptionPlans.map((x) => x.toMap()).toList(),
      'rates': rates.map((x) => x.toMap()).toList(),
      'reports': reports.map((x) => x.toMap()).toList(),
    };
  }

  factory ChannelMaterialModel.fromMap(Map<String, dynamic> map) {
    return ChannelMaterialModel(
      id: map['id'] as int,
      sellerProfileId: map['sellerProfileId'] as int,
      parent: Parent.fromMap(map['parent'] as Map<String, dynamic>),
      type: Type.fromMap(map['type'] as Map<String, dynamic>),
      genere: Genere.fromMap(map['genere'] as Map<String, dynamic>),
      catagory: Catagory.fromMap(map['catagory'] as Map<String, dynamic>),
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
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      channelMaterialImages: List<ChannelMaterialImage>.from(
        (map['channelMaterialImages'] as List<int>).map<ChannelMaterialImage>(
          (x) => ChannelMaterialImage.fromMap(x as Map<String, dynamic>),
        ),
      ),
      channelMaterialPreviews: List<ChannelPreviewMaterial>.from(
        (map['channelMaterialPreviews'] as List<int>)
            .map<ChannelPreviewMaterial>(
          (x) => ChannelPreviewMaterial.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sellerProfile:
          SellerProfile.fromMap(map['sellerProfile'] as Map<String, dynamic>),
      favorites: List<Favorite>.from(
        (map['favorites'] as List<int>).map<Favorite>(
          (x) => Favorite.fromMap(x as Map<String, dynamic>),
        ),
      ),
      materialInSubscriptionPlans: List<MaterialInSubscriptionPlan>.from(
        (map['materialInSubscriptionPlans'] as List<int>)
            .map<MaterialInSubscriptionPlan>(
          (x) => MaterialInSubscriptionPlan.fromMap(x as Map<String, dynamic>),
        ),
      ),
      rates: List<Rate>.from(
        (map['rates'] as List<int>).map<Rate>(
          (x) => Rate.fromMap(x as Map<String, dynamic>),
        ),
      ),
      reports: List<Report>.from(
        (map['reports'] as List<int>).map<Report>(
          (x) => Report.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'primary': primary,
      'cover': cover,
      'channelMaterialId': channelMaterialId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ChannelMaterialImageModel.fromMap(Map<String, dynamic> map) {
    return ChannelMaterialImageModel(
      id: map['id'] as int,
      image: map['image'] as String,
      primary: map['primary'] as bool,
      cover: map['cover'] as bool,
      channelMaterialId: map['channelMaterialId'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'preview': preview,
      'channelMaterialId': channelMaterialId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ChannelPreviewMaterialModel.fromMap(Map<String, dynamic> map) {
    return ChannelPreviewMaterialModel(
      id: map['id'] as int,
      preview: map['preview'] as String,
      channelMaterialId: map['channelMaterialId'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelPreviewMaterialModel.fromJson(String source) =>
      ChannelPreviewMaterialModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

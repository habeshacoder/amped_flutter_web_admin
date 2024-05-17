// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/core/utils/enums.dart';
import 'package:amped_media_admin/features/material/domain/entities/material.dart';
import '../../../materialuser/domain/entities/materialuser.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';

class MaterialModel extends Material {
  MaterialModel({
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
    super.price,
    required super.createdAt,
    required super.updatedAt,
    // super.favorites,
    super.materialImages,
    super.materialPreviews,
    super.materialUsers,
    required super.sellerProfile,
    super.rates,
    super.reports,
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
      'price': price,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'materialImages': materialImages.map((x) => x?.toMap()).toList(),
      'materialPreviews': materialPreviews.map((x) => x?.toMap()).toList(),
      'materialUsers': materialUsers.map((x) => x?.toMap()).toList(),
      'sellerProfile': sellerProfile?.toMap(),
      'rates': rates.map((x) => x?.toMap()).toList(),
      'reports': reports.map((x) => x?.toMap()).toList(),
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
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
      price: map['price'] != null ? map['price'] as double : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      materialImages: map['materialImages'] != null
          ? List<MaterialImage>.from(
              (map['materialImages'] as List<int>).map<MaterialImage?>(
                (x) => MaterialImage.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      materialPreviews: map['materialPreviews'] != null
          ? List<PreviewMaterial>.from(
              (map['materialPreviews'] as List<int>).map<PreviewMaterial?>(
                (x) => PreviewMaterial.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      materialUsers: map['materialUsers'] != null
          ? List<MaterialUser>.from(
              (map['materialUsers'] as List<int>).map<MaterialUser?>(
                (x) => MaterialUser.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      sellerProfile: map['sellerProfile'] != null
          ? SellerProfile.fromMap(map['sellerProfile'] as Map<String, dynamic>)
          : null,
      rates: map['rates'] != null
          ? List<Rate>.from(
              (map['rates'] as List<int>).map<Rate?>(
                (x) => Rate.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      reports: map['reports'] != null
          ? List<Report>.from(
              (map['reports'] as List<int>).map<Report?>(
                (x) => Report.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialModel.fromJson(String source) =>
      MaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MaterialImageModel extends MaterialImage {
  MaterialImageModel({
    required super.id,
    required super.image,
    required super.isPrimary,
    required super.isCover,
    required super.materialId,
    required super.createdAt,
    required super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'isPrimary': isPrimary,
      'isCover': isCover,
      'materialId': materialId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory MaterialImageModel.fromMap(Map<String, dynamic> map) {
    return MaterialImageModel(
      id: map['id'] as int,
      image: map['image'] as String,
      isPrimary: map['isPrimary'] as bool,
      isCover: map['isCover'] as bool,
      materialId: map['materialId'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialImageModel.fromJson(String source) =>
      MaterialImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PreviewMaterialModel extends PreviewMaterial {
  PreviewMaterialModel({
    required super.id,
    required super.preview,
    required super.materialId,
    required super.createdAt,
    required super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'preview': preview,
      'materialId': materialId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory PreviewMaterialModel.fromMap(Map<String, dynamic> map) {
    return PreviewMaterialModel(
      id: map['id'] as int,
      preview: map['preview'] as String,
      materialId: map['materialId'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviewMaterialModel.fromJson(String source) =>
      PreviewMaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

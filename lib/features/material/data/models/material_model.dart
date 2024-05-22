// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/material/domain/entities/material.dart';

import '../../../sellerprofile/data/models/sellerprofile_model.dart';

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
    // super.materialPreviews,
    // super.materialUsers,
    required super.sellerProfile,
    // super.rates,
    // super.reports,
  });

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['id'],
      sellerProfileId: map['sellecrProfile_id'],
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
      price: map['price'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      materialImages:
          map['material_image'] != null || map['material_image'] != []
              ? List<MaterialImage>.from(
                  (map['material_image']).map<MaterialImage?>(
                    (x) => MaterialImageModel.fromMap(x),
                  ),
                )
              : [],
      // materialPreviews:
      //     map['materialPreviews'] != null || map['materialPreviews'] != []
      //         ? List<PreviewMaterial>.from(
      //             (map['materialPreviews']).map<PreviewMaterial?>(
      //               (x) => PreviewMaterialModel.fromMap(x),
      //             ),
      //           )
      //         : [],
      // materialUsers: map['materialUsers'] != null || map['materialUsers'] != []
      //     ? List<MaterialUser>.from(
      //         (map['materialUsers']).map<MaterialUser?>(
      //           (x) => MaterialUserModel.fromMap(x),
      //         ),
      //       )
      //     : [],
      sellerProfile: map['SellerProfile'] != null || map['SellerProfile'] != {}
          ? SellerProfileModel.fromMap(map['SellerProfile'])
          : null,
      // rates: map['rates'] != null || map['rates'] != []
      //     ? List<Rate>.from(
      //         (map['rates']).map<Rate?>(
      //           (x) => RateModel.fromMap(x),
      //         ),
      //       )
      //     : [],
      // reports: map['reports'] != null || map['reports'] != []
      //     ? List<Report>.from(
      //         (map['reports']).map<Report?>(
      //           (x) => ReportModel.fromMap(x),
      //         ),
      //       )
      //     : [],
    );
  }

  factory MaterialModel.fromJson(Map<String, dynamic> source) =>
      MaterialModel.fromMap(source);
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

  factory MaterialImageModel.fromMap(Map<String, dynamic> map) {
    return MaterialImageModel(
      id: map['id'],
      image: map['image'],
      isPrimary: map['isPrimary'],
      isCover: map['isCover'],
      materialId: map['material_Id'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory MaterialImageModel.fromJson(Map<String, dynamic> source) =>
      MaterialImageModel.fromMap(source);
}

class PreviewMaterialModel extends PreviewMaterial {
  PreviewMaterialModel({
    required super.id,
    required super.preview,
    required super.materialId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PreviewMaterialModel.fromMap(Map<String, dynamic> map) {
    return PreviewMaterialModel(
      id: map['id'],
      preview: map['preview'],
      materialId: map['materialId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  factory PreviewMaterialModel.fromJson(Map<String, dynamic> source) =>
      PreviewMaterialModel.fromMap(source);
}

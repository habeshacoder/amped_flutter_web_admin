import 'package:amped_media_admin/core/utils/enums.dart';
import '../../../materialuser/domain/entities/materialuser.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';

class Material {
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
  final double? price;
  final DateTime? createdAt;
  final DateTime updatedAt;
  // final List<Favorite>? favorites;
  final List<MaterialImage>? materialImages;
  final List<PreviewMaterial>? materialPreviews;
  final List<MaterialUser>? materialUsers;
  final SellerProfile? sellerProfile;
  final List<Rate>? rates;
  final List<Report>? reports;

  Material({
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
    this.price,
    required this.createdAt,
    required this.updatedAt,
    // this.favorites,
    this.materialImages,
    this.materialPreviews,
    this.materialUsers,
    required this.sellerProfile,
    this.rates,
    this.reports,
  });
}

class MaterialImage {
  final int id;
  final String image;
  final bool isPrimary;
  final bool isCover;
  final int materialId;
  final DateTime createdAt;
  final DateTime updatedAt;

  MaterialImage({
    required this.id,
    required this.image,
    required this.isPrimary,
    required this.isCover,
    required this.materialId,
    required this.createdAt,
    required this.updatedAt,
  });
}

class PreviewMaterial {
  final int id;
  final String preview;
  final int materialId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PreviewMaterial({
    required this.id,
    required this.preview,
    required this.materialId,
    required this.createdAt,
    required this.updatedAt,
  });
}

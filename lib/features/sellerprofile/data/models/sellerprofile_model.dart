// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/sellerprofile/domain/entities/sellerprofile.dart';

class SellerProfileModel extends SellerProfile {
  SellerProfileModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.sex,
    super.dateOfBirth,
    super.description,
    super.image,
    super.coverImage,
    required super.createdAt,
    required super.updatedAt,
    // required super.channelMaterials,
    // required super.channels,
    // required super.materials,
    // required super.user,
    // required this.socialLinksProfiles,
  });

  factory SellerProfileModel.fromMap(Map<String, dynamic> map) {
    return SellerProfileModel(
      id: map['id'],
      userId: map['user_id'],
      name: map['name'],
      sex: map['sex'],
      dateOfBirth: map['date_of_birth'],
      description: map['description'],
      image: map['image'],
      coverImage: map['cover_Image'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      // channelMaterials:
      //     map['channelMaterials'] != null || map['channelMaterials'] != []
      //         ? List<ChannelMaterial>.from(
      //             (map['channelMaterials']).map<ChannelMaterial>(
      //               (x) => ChannelMaterialModel.fromMap(x),
      //             ),
      //           )
      //         : [],
      // channels: map['channels'] != null || map['channels'] != []
      //     ? List<Channel>.from(
      //         (map['channels']).map<Channel>(
      //           (x) => ChannelModel.fromMap(x),
      //         ),
      //       )
      //     : [],
      // materials: map['materials'] != null || map['materials'] != []
      //     ? List<Material>.from(
      //         (map['materials']).map<Material>(
      //           (x) => MaterialModel.fromMap(x as Map<String, dynamic>),
      //         ),
      //       )
      //     : [],
      // user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
    );
  }

  factory SellerProfileModel.fromJson(Map<String, dynamic> source) =>
      SellerProfileModel.fromMap(source);
}

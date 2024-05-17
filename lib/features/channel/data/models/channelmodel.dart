// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amped_media_admin/features/channel/domain/entities/channel.dart';
import '../../../favorite/domain/entities/favorite.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';
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
    required super.favorite,
    required super.rate,
    required super.report,
    required super.subscriptionPlan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'draft': draft,
      'sellerProfileId': sellerProfileId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'channelImage': channelImage.map((x) => x.toMap()).toList(),
      'channelPreview': channelPreview.map((x) => x.toMap()).toList(),
      'sellerProfile': sellerProfile.toMap(),
      'favorite': favorite.map((x) => x.toMap()).toList(),
      'rate': rate.map((x) => x.toMap()).toList(),
      'report': report.map((x) => x.toMap()).toList(),
      'subscriptionPlan': subscriptionPlan.map((x) => x.toMap()).toList(),
    };
  }

  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      draft: map['draft'] as bool,
      sellerProfileId: map['sellerProfileId'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      channelImage: List<ChannelImageModel>.from(
        (map['channelImage'] as List<int>).map<ChannelImageModel>(
          (x) => ChannelImageModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      channelPreview: List<PreviewChannelModel>.from(
        (map['channelPreview'] as List<int>).map<PreviewChannelModel>(
          (x) => PreviewChannelModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sellerProfile:
          SellerProfile.fromMap(map['sellerProfile'] as Map<String, dynamic>),
      favorite: List<Favorite>.from(
        (map['favorite'] as List<int>).map<Favorite>(
          (x) => Favorite.fromMap(x as Map<String, dynamic>),
        ),
      ),
      rate: List<Rate>.from(
        (map['rate'] as List<int>).map<Rate>(
          (x) => Rate.fromMap(x as Map<String, dynamic>),
        ),
      ),
      report: List<Report>.from(
        (map['report'] as List<int>).map<Report>(
          (x) => Report.fromMap(x as Map<String, dynamic>),
        ),
      ),
      subscriptionPlan: List<SubscriptionPlan>.from(
        (map['subscriptionPlan'] as List<int>).map<SubscriptionPlan>(
          (x) => SubscriptionPlan.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelModel.fromJson(String source) =>
      ChannelModel.fromMap(json.decode(source) as Map<String, dynamic>);
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'primary': primary,
      'cover': cover,
      'channelId': channelId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ChannelImageModel.fromMap(Map<String, dynamic> map) {
    return ChannelImageModel(
      id: map['id'] as int,
      image: map['image'] as String,
      primary: map['primary'] as bool,
      cover: map['cover'] as bool,
      channelId: map['channelId'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelImageModel.fromJson(String source) =>
      ChannelImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PreviewChannelModel extends PreviewChannel {
  PreviewChannelModel({
    required super.id,
    required super.preview,
    required super.channelId,
    required super.createdAt,
    required super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'preview': preview,
      'channelId': channelId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory PreviewChannelModel.fromMap(Map<String, dynamic> map) {
    return PreviewChannelModel(
      id: map['id'] as int ?? 0,
      preview: map['preview'] as String ?? '',
      channelId: map['channelId'] as int ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviewChannelModel.fromJson(String source) =>
      PreviewChannelModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import '../../../favorite/domain/entities/favorite.dart';
import '../../../report/domain/entities/reports.dart';
import '../../../review_rate/domain/entities/rate.dart';
import '../../../sellerprofile/domain/entities/sellerprofile.dart';
import '../../../subscriptionplan/domain/entities/subscriptionplan.dart';

class Channel {
  final int id;
  final String name;
  final String? description;
  final bool draft;
  final int sellerProfileId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ChannelImage> channelImage;
  final List<PreviewChannel> channelPreview;
  final SellerProfile sellerProfile;
  final List<Favorite> favorite;
  final List<Rate> rate;
  final List<Report> report;
  final List<SubscriptionPlan> subscriptionPlan;

  Channel({
    required this.id,
    required this.name,
    this.description,
    required this.draft,
    required this.sellerProfileId,
    required this.createdAt,
    required this.updatedAt,
    required this.channelImage,
    required this.channelPreview,
    required this.sellerProfile,
    required this.favorite,
    required this.rate,
    required this.report,
    required this.subscriptionPlan,
  });
}

class ChannelImage {
  final int id;
  final String image;
  final bool primary;
  final bool cover;
  final int channelId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChannelImage({
    required this.id,
    required this.image,
    required this.primary,
    required this.cover,
    required this.channelId,
    required this.createdAt,
    required this.updatedAt,
  });
}

class PreviewChannel {
  final int id;
  final String preview;
  final int channelId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PreviewChannel({
    required this.id,
    required this.preview,
    required this.channelId,
    required this.createdAt,
    required this.updatedAt,
  });
}

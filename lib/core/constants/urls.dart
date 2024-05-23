class Urls {
  static final String BackEndUrl = 'http://127.0.0.1:3007';

  static final String getAllChannelsUrl = '$BackEndUrl/channel';
  static final String deleteChannelsUrl = '$BackEndUrl/channel';
  static final String searchChannelsUrl = '$BackEndUrl/search/channel';

  static final String getAllProfilesUrl = '$BackEndUrl/profiles';
  static final String deleteProfilesUrl = '$BackEndUrl/profiles';
  static final String searchProfilesUrl = '$BackEndUrl/search/profile';

  static final String getAllSelleProfilesUrl = '$BackEndUrl/seller-profiles';
  static final String deleteSelleProfilesUrl = '$BackEndUrl/seller-profiles';
  static final String searchSelleProfilesUrl =
      '$BackEndUrl/search/sellerProfile';

  static final String getAllMaterialUrl = '$BackEndUrl/material';
  static final String deleteMaterialUrl = '$BackEndUrl/material';
  static final String searchMaterialUrl = '$BackEndUrl/search';

  static final String getAllChannelMaterilaUrl = '$BackEndUrl/channel-material';
  static final String deleteChannelMaterilaUrl = '$BackEndUrl/channel-material';
  static final String searchChannelMaterilaUrl =
      '$BackEndUrl/search/channel-material';

  static final String getAllFavoriteUrl = '$BackEndUrl/channels';
  static final String deleteFavoriteUrl = '$BackEndUrl/channels';

  static final String searchMaterialInSubscriptionPlanUrl =
      '$BackEndUrl/search/materialin_subscription-plan';
  static final String deleteMaterialInSubscriptionPlanUrl =
      '$BackEndUrl/subscription-plan';
  static final String getMaterialInSubscriptionPlanUrl =
      '$BackEndUrl/subscription-plan/getmaterials';

  static final String getAllMaterialUserUrl = '$BackEndUrl/channels';
  static final String deleteMaterialUserUrl = '$BackEndUrl/channels';

  static final String getAllReplaysUrl = '$BackEndUrl/channels';
  static final String deleteReplaysUrl = '$BackEndUrl/channels';

  static final String getAllReportsUrl = '$BackEndUrl/reports';
  static final String deleteReportsUrl = '$BackEndUrl/channels';

  static final String getallRatesUrl = '$BackEndUrl/channels';
  static final String deleteRatesUrl = '$BackEndUrl/channels';

  static final String getAllSubscribedUserUrl = '$BackEndUrl/channels';
  static final String deleteSubscribedUserUrl = '$BackEndUrl/subscription-plan';

  static final String getAllSubscriptionPlanUrl =
      '$BackEndUrl/subscription-plan';
  static final String deleteSubscriptionPlanUrl =
      '$BackEndUrl/subscription-plan';
  static final String searchSubscriptionPlanUrl =
      '$BackEndUrl/search/subscription-plan';

  static final String getAllUserUrl = '$BackEndUrl/users/all';
  static final String deleteUserUrl = '$BackEndUrl/users/delete';
  static final String searchUserUrl = '$BackEndUrl/search/user';

  static final String getAllReplayUrl = '$BackEndUrl/replays';
  static final String deleteReplayUrl = '$BackEndUrl/replays';
  static final String searchReplayUrl = '$BackEndUrl/search/replays';
}

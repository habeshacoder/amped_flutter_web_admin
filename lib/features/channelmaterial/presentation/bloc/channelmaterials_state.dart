part of 'channelmaterial_bloc.dart';

sealed class ChannelMaterialsState {}

final class ChannelMaterialInitial extends ChannelMaterialsState {}

final class ChannelMaterialLoading extends ChannelMaterialsState {}

final class ChannelMaterialFailureState extends ChannelMaterialsState {
  final String error;
  ChannelMaterialFailureState(this.error);
}

final class ChannelMaterialDeleteSuccessState extends ChannelMaterialsState {
  final String message;

  ChannelMaterialDeleteSuccessState({required this.message});
}

final class ChannelMaterialsDisplaySuccessState extends ChannelMaterialsState {
  final List<ChannelMaterial> ChannelMaterials;

  ChannelMaterialsDisplaySuccessState(this.ChannelMaterials);
}

final class SearchChannelMaterialSuccessState extends ChannelMaterialsState {
  final List<ChannelMaterial> ChannelMaterials;

  SearchChannelMaterialSuccessState({required this.ChannelMaterials});
}

final data = [
  {
    "id": 6,
    "sellerProfile_id": 8,
    "parent": "Publication",
    "type": "Audiobook",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "James Clear",
    "reader": "ዋለልኝ ሰውነት",
    "translator": "ገረመው አደፍርስ",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "null",
    "title": "Atomic Habits",
    "description": "ሰው",
    "created_at": "2024-05-22T12:57:44.466Z",
    "updated_at": "2024-05-22T12:57:44.466Z",
    "channel_material_image": [],
    "channel_material_preview": [],
    "material_in_subscription_plan": [
      {
        "id": 2,
        "subscriptionPlan_id": 2,
        "channelMaterial_id": 6,
        "created_at": "2024-05-22T12:57:44.552Z",
        "updated_at": "2024-05-22T12:57:44.552Z"
      }
    ],
    "rate": [],
    "report": []
  },
  {
    "id": 7,
    "sellerProfile_id": 8,
    "parent": "Publication",
    "type": "Audiobook",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "James Clear",
    "reader": "ዋለልኝ ሰውነት",
    "translator": "ገረመው አደፍርስ",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "null",
    "title": "Atomic Habits",
    "description": "ሰው",
    "created_at": "2024-05-22T12:57:56.783Z",
    "updated_at": "2024-05-22T12:57:56.783Z",
    "channel_material_image": [],
    "channel_material_preview": [],
    "material_in_subscription_plan": [],
    "rate": [],
    "report": []
  },
  {
    "id": 8,
    "sellerProfile_id": 8,
    "parent": "Publication",
    "type": "Audiobook",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "James Clear",
    "reader": "ዋለልኝ ሰውነት",
    "translator": "ገረመው አደፍርስ",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "1716383092924-540853782.mp3",
    "title": "Atomic Habits",
    "description": "ሰው",
    "created_at": "2024-05-22T12:58:03.566Z",
    "updated_at": "2024-05-22T13:04:53.028Z",
    "channel_material_image": [
      {
        "id": 5,
        "image": "1716383092929-637988801.jpeg",
        "primary": true,
        "cover": false,
        "channel_material_id": 8,
        "created_at": "2024-05-22T13:04:53.059Z",
        "updated_at": "2024-05-22T13:04:53.059Z"
      },
      {
        "id": 6,
        "image": "1716383092929-490893165.png",
        "primary": false,
        "cover": true,
        "channel_material_id": 8,
        "created_at": "2024-05-22T13:04:53.100Z",
        "updated_at": "2024-05-22T13:04:53.100Z"
      }
    ],
    "channel_material_preview": [
      {
        "id": 3,
        "preview": "1716383092930-69557404.jpeg",
        "channel_material_id": 8,
        "created_at": "2024-05-22T13:04:53.116Z",
        "updated_at": "2024-05-22T13:04:53.116Z"
      }
    ],
    "material_in_subscription_plan": [
      {
        "id": 3,
        "subscriptionPlan_id": 2,
        "channelMaterial_id": 8,
        "created_at": "2024-05-22T12:58:03.648Z",
        "updated_at": "2024-05-22T12:58:03.648Z"
      }
    ],
    "rate": [],
    "report": []
  }
];

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

  static final String getAllChannelMaterilaUrl = '$BackEndUrl/channels';
  static final String deleteChannelMaterilaUrl = '$BackEndUrl/channels';

  static final String getAllFavoriteUrl = '$BackEndUrl/channels';
  static final String deleteFavoriteUrl = '$BackEndUrl/channels';

  static final String getAllMaterialInSubscriptionPlanUrl =
      '$BackEndUrl/channels';
  static final String deleteMaterialInSubscriptionPlanUrl =
      '$BackEndUrl/channels';

  static final String getAllMaterialUserUrl = '$BackEndUrl/channels';
  static final String deleteMaterialUserUrl = '$BackEndUrl/channels';

  static final String getAllReplaysUrl = '$BackEndUrl/channels';
  static final String deleteReplaysUrl = '$BackEndUrl/channels';

  static final String getAllReportsUrl = '$BackEndUrl/reports';
  static final String deleteReportsUrl = '$BackEndUrl/channels';

  static final String getallRatesUrl = '$BackEndUrl/channels';
  static final String deleteRatesUrl = '$BackEndUrl/channels';

  static final String getAllSubscribedUserUrl = '$BackEndUrl/channels';
  static final String deleteSubscribedUserUrl = '$BackEndUrl/channels';

  static final String getAllSubscriptionPlanUrl = '$BackEndUrl/channels';
  static final String deleteSubscriptionPlanUrl = '$BackEndUrl/channels';

  static final String getAllUserUrl = '$BackEndUrl/users/all';
  static final String deleteUserUrl = '$BackEndUrl/users/delete';
  static final String searchUserUrl = '$BackEndUrl/search/user';
}

final chanels = [
  {
    "id": 101,
    "sellecrProfile_id": 6,
    "parent": "Audio",
    "type": "Podcast",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "James Clear",
    "reader": "abdu",
    "translator": "abdu",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "null",
    "title": "amped now added",
    "description": "ሰው",
    "price": 199,
    "created_at": "2024-05-01T01:21:33.793Z",
    "updated_at": "2024-05-01T01:21:33.793Z",
    "material_image": [],
    "material_preview": [],
    "material_user": [],
    "rate": [
      {
        "id": 7,
        "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
        "rating": 4,
        "remark": "good",
        "material_id": 101,
        "channel_id": null,
        "channel_material_id": null,
        "created_at": "2024-05-02T02:14:50.416Z",
        "updated_at": "2024-05-02T02:14:50.416Z"
      }
    ],
    "report": [
      {
        "id": 4,
        "report_type": "Stereotype",
        "report_desc": "useless",
        "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
        "material_id": 101,
        "channel_id": null,
        "channel_material_id": null,
        "created_at": "2024-05-02T01:54:29.869Z",
        "updated_at": "2024-05-02T01:54:29.869Z"
      }
    ],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 102,
    "sellerProfile_id": 6,
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
    "material": "1714526945052-192940258.mp3",
    "title": "Atomic Habits",
    "description": "ሰው",
    "price": 199,
    "created_at": "2024-05-01T01:28:12.721Z",
    "updated_at": "2024-05-01T01:29:05.079Z",
    "material_image": [
      {
        "id": 64,
        "image": "1714526945063-204852574.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 102,
        "created_at": "2024-05-01T01:29:05.112Z",
        "updated_at": "2024-05-01T01:29:05.112Z"
      },
      {
        "id": 65,
        "image": "1714526945063-298291240.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 102,
        "created_at": "2024-05-01T01:29:05.212Z",
        "updated_at": "2024-05-01T01:29:05.212Z"
      },
      {
        "id": 66,
        "image": "1714526945071-648297734.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 102,
        "created_at": "2024-05-01T01:29:05.228Z",
        "updated_at": "2024-05-01T01:29:05.228Z"
      }
    ],
    "material_preview": [
      {
        "id": 22,
        "preview": "1714526945064-401837244.mp3",
        "material_id": 102,
        "created_at": "2024-05-01T01:29:05.220Z",
        "updated_at": "2024-05-01T01:29:05.220Z"
      }
    ],
    "material_user": [],
    "rate": [
      {
        "id": 8,
        "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
        "rating": 4,
        "remark": "very amazing",
        "material_id": 102,
        "channel_id": null,
        "channel_material_id": null,
        "created_at": "2024-05-02T02:15:01.729Z",
        "updated_at": "2024-05-02T02:15:01.729Z"
      }
    ],
    "report": [
      {
        "id": 6,
        "report_type": "Stereotype",
        "report_desc": "scam",
        "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
        "material_id": 102,
        "channel_id": null,
        "channel_material_id": null,
        "created_at": "2024-05-02T01:55:16.449Z",
        "updated_at": "2024-05-02T01:55:16.449Z"
      }
    ],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 103,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Audiobook",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "John",
    "reader": "abebe",
    "translator": "ገረመው አደፍርስ",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "1714527175104-605383457.mp3",
    "title": "The Coder",
    "description": "coding habits",
    "price": 233,
    "created_at": "2024-05-01T01:32:22.597Z",
    "updated_at": "2024-05-01T01:32:55.122Z",
    "material_image": [
      {
        "id": 67,
        "image": "1714527175112-11784369.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 103,
        "created_at": "2024-05-01T01:32:55.148Z",
        "updated_at": "2024-05-01T01:32:55.148Z"
      },
      {
        "id": 68,
        "image": "1714527175112-398010848.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 103,
        "created_at": "2024-05-01T01:32:55.156Z",
        "updated_at": "2024-05-01T01:32:55.156Z"
      },
      {
        "id": 69,
        "image": "1714527175117-40429861.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 103,
        "created_at": "2024-05-01T01:32:55.173Z",
        "updated_at": "2024-05-01T01:32:55.173Z"
      }
    ],
    "material_preview": [
      {
        "id": 23,
        "preview": "1714527175112-182139430.mp3",
        "material_id": 103,
        "created_at": "2024-05-01T01:32:55.164Z",
        "updated_at": "2024-05-01T01:32:55.164Z"
      }
    ],
    "material_user": [],
    "rate": [
      {
        "id": 6,
        "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
        "rating": 5,
        "remark": "good",
        "material_id": 103,
        "channel_id": null,
        "channel_material_id": null,
        "created_at": "2024-05-01T06:41:36.794Z",
        "updated_at": "2024-05-01T06:41:36.794Z"
      }
    ],
    "report": [
      {
        "id": 7,
        "report_type": "Stereotype",
        "report_desc": "Adult content",
        "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
        "material_id": 103,
        "channel_id": null,
        "channel_material_id": null,
        "created_at": "2024-05-02T01:55:42.620Z",
        "updated_at": "2024-05-02T01:55:42.620Z"
      }
    ],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 104,
    "sellerProfile_id": 6,
    "parent": "Audio",
    "type": "Podcast",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "Ermias",
    "reader": "abebe",
    "translator": "ገረመው አደፍርስ",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 1,
    "continues_from": 1,
    "material": "1714527463169-225308927.mp3",
    "title": "The Coder",
    "description": "coding habits",
    "price": 5,
    "created_at": "2024-05-01T01:37:02.565Z",
    "updated_at": "2024-05-01T01:37:43.187Z",
    "material_image": [
      {
        "id": 70,
        "image": "1714527463175-364328761.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 104,
        "created_at": "2024-05-01T01:37:43.210Z",
        "updated_at": "2024-05-01T01:37:43.210Z"
      },
      {
        "id": 71,
        "image": "1714527463175-265860573.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 104,
        "created_at": "2024-05-01T01:37:43.218Z",
        "updated_at": "2024-05-01T01:37:43.218Z"
      },
      {
        "id": 72,
        "image": "1714527463182-985761660.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 104,
        "created_at": "2024-05-01T01:37:43.235Z",
        "updated_at": "2024-05-01T01:37:43.235Z"
      }
    ],
    "material_preview": [
      {
        "id": 24,
        "preview": "1714527463175-618964258.mp3",
        "material_id": 104,
        "created_at": "2024-05-01T01:37:43.227Z",
        "updated_at": "2024-05-01T01:37:43.227Z"
      }
    ],
    "material_user": [],
    "rate": [
      {
        "id": 9,
        "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
        "rating": 3,
        "remark": "not bad",
        "material_id": 104,
        "channel_id": null,
        "channel_material_id": null,
        "created_at": "2024-05-02T02:15:22.074Z",
        "updated_at": "2024-05-02T02:15:22.074Z"
      }
    ],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 105,
    "sellerProfile_id": 6,
    "parent": "Audio",
    "type": "Podcast",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "Ermias",
    "reader": "abebe",
    "translator": "ገረመው አደፍርስ",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 1,
    "continues_from": 1,
    "material": "1714527622614-522394036.mp3",
    "title": "Freelancing",
    "description": "detailed description on Freelancing",
    "price": 5,
    "created_at": "2024-05-01T01:39:42.829Z",
    "updated_at": "2024-05-01T01:40:22.635Z",
    "material_image": [
      {
        "id": 73,
        "image": "1714527622619-429839768.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 105,
        "created_at": "2024-05-01T01:40:22.658Z",
        "updated_at": "2024-05-01T01:40:22.658Z"
      },
      {
        "id": 74,
        "image": "1714527622619-109038942.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 105,
        "created_at": "2024-05-01T01:40:22.666Z",
        "updated_at": "2024-05-01T01:40:22.666Z"
      },
      {
        "id": 75,
        "image": "1714527622630-213653440.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 105,
        "created_at": "2024-05-01T01:40:22.683Z",
        "updated_at": "2024-05-01T01:40:22.683Z"
      }
    ],
    "material_preview": [
      {
        "id": 25,
        "preview": "1714527622619-844718418.mp3",
        "material_id": 105,
        "created_at": "2024-05-01T01:40:22.674Z",
        "updated_at": "2024-05-01T01:40:22.674Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 107,
    "sellerProfile_id": 8,
    "parent": "Publication",
    "type": "Book",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "Markabel Dumas",
    "reader": "Markabel Dumas",
    "translator": "Markabel Dumas",
    "length_minute": 0,
    "length_page": 238,
    "first_published_at": "1990",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "null",
    "title": "Nu Enkefafel",
    "description": "come and get the truth",
    "price": 299,
    "created_at": "2024-05-01T05:19:31.271Z",
    "updated_at": "2024-05-01T05:19:31.271Z",
    "material_image": [],
    "material_preview": [],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 8,
      "user_id": "a45ae7ea-5e54-4238-9313-7bff7248c31c",
      "name": "sireat",
      "sex": "Male",
      "date_of_birth": "02/21/1995",
      "description": "sireat seller profile description",
      "image": "1714540642955-218793729.png",
      "cover_image": "1714540642955-643106619.png",
      "created_at": "2024-05-01T05:17:22.977Z",
      "updated_at": "2024-05-01T05:17:22.977Z"
    }
  },
  {
    "id": 108,
    "sellerProfile_id": 6,
    "parent": "Audio",
    "type": "Magazine",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "James Clear",
    "reader": "adoni",
    "translator": "",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "1714548779313-223166388.epub",
    "title": "amped now added",
    "description": "Magazine about the ethiopian tech startups",
    "price": 100,
    "created_at": "2024-05-01T06:49:33.012Z",
    "updated_at": "2024-05-01T07:32:59.322Z",
    "material_image": [
      {
        "id": 76,
        "image": "1714548685522-585526012.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 108,
        "created_at": "2024-05-01T07:31:25.772Z",
        "updated_at": "2024-05-01T07:31:25.772Z"
      },
      {
        "id": 77,
        "image": "1714548685522-4275398.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 108,
        "created_at": "2024-05-01T07:31:25.821Z",
        "updated_at": "2024-05-01T07:31:25.821Z"
      },
      {
        "id": 78,
        "image": "1714548685522-651039743.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 108,
        "created_at": "2024-05-01T07:31:25.855Z",
        "updated_at": "2024-05-01T07:31:25.855Z"
      },
      {
        "id": 79,
        "image": "1714548779313-344103534.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 108,
        "created_at": "2024-05-01T07:32:59.414Z",
        "updated_at": "2024-05-01T07:32:59.414Z"
      },
      {
        "id": 80,
        "image": "1714548779313-13639615.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 108,
        "created_at": "2024-05-01T07:32:59.422Z",
        "updated_at": "2024-05-01T07:32:59.422Z"
      },
      {
        "id": 81,
        "image": "1714548779313-32354632.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 108,
        "created_at": "2024-05-01T07:32:59.439Z",
        "updated_at": "2024-05-01T07:32:59.439Z"
      }
    ],
    "material_preview": [
      {
        "id": 26,
        "preview": "1714548685523-783048563.jpeg",
        "material_id": 108,
        "created_at": "2024-05-01T07:31:25.837Z",
        "updated_at": "2024-05-01T07:31:25.837Z"
      },
      {
        "id": 27,
        "preview": "1714548779314-394499235.jpeg",
        "material_id": 108,
        "created_at": "2024-05-01T07:32:59.430Z",
        "updated_at": "2024-05-01T07:32:59.430Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 27,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Unspecified",
    "genere": "Unspecified",
    "catagory": "Unspecified",
    "author": "Adoni",
    "reader": "",
    "translator": "Adoni",
    "length_minute": 0,
    "length_page": 2,
    "first_published_at": "0",
    "language": "English",
    "publisher": "Adoni",
    "episode": 0,
    "continues_from": 0,
    "material": "null",
    "title": "test book",
    "description": "We created this channel for many things",
    "price": 100,
    "created_at": "2024-04-11T13:17:04.483Z",
    "updated_at": "2024-04-11T13:17:04.483Z",
    "material_image": [],
    "material_preview": [],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 28,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Book",
    "genere": "Unspecified",
    "catagory": "Unspecified",
    "author": "Adoni",
    "reader": "",
    "translator": "Adon",
    "length_minute": 0,
    "length_page": 3,
    "first_published_at": "0",
    "language": "English",
    "publisher": "Adoni",
    "episode": 0,
    "continues_from": 0,
    "material": "null",
    "title": "test book",
    "description": "book description",
    "price": 50,
    "created_at": "2024-04-11T13:30:30.848Z",
    "updated_at": "2024-04-11T13:30:30.848Z",
    "material_image": [],
    "material_preview": [],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 29,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Book",
    "genere": "Unspecified",
    "catagory": "Unspecified",
    "author": "Adoni",
    "reader": "",
    "translator": "Adoni",
    "length_minute": 0,
    "length_page": 3,
    "first_published_at": "0",
    "language": "English",
    "publisher": "Adoni",
    "episode": 0,
    "continues_from": 0,
    "material": "null",
    "title": "sample",
    "description": "description ",
    "price": 40,
    "created_at": "2024-04-11T13:42:35.200Z",
    "updated_at": "2024-04-11T13:42:35.200Z",
    "material_image": [],
    "material_preview": [],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 30,
    "sellerProfile_id": 6,
    "parent": "Unspecified",
    "type": "Unspecified",
    "genere": "Unspecified",
    "catagory": "Unspecified",
    "author": "Adoni",
    "reader": "",
    "translator": "Adoni",
    "length_minute": 0,
    "length_page": 3,
    "first_published_at": "0",
    "language": "English",
    "publisher": "Adoni",
    "episode": 0,
    "continues_from": 0,
    "material": "1712854265494-864383260.epub",
    "title": "test",
    "description": "testdescription",
    "price": 20,
    "created_at": "2024-04-11T16:49:59.173Z",
    "updated_at": "2024-04-11T16:51:05.516Z",
    "material_image": [
      {
        "id": 49,
        "image": "1712854265474-816611483.jpg",
        "primary": true,
        "cover": false,
        "material_id": 30,
        "created_at": "2024-04-11T16:51:05.565Z",
        "updated_at": "2024-04-11T16:51:05.565Z"
      },
      {
        "id": 50,
        "image": "1712854265482-642589357.jpg",
        "primary": false,
        "cover": true,
        "material_id": 30,
        "created_at": "2024-04-11T16:51:05.624Z",
        "updated_at": "2024-04-11T16:51:05.624Z"
      },
      {
        "id": 51,
        "image": "1712854265494-142782191.jpg",
        "primary": false,
        "cover": false,
        "material_id": 30,
        "created_at": "2024-04-11T16:51:05.656Z",
        "updated_at": "2024-04-11T16:51:05.656Z"
      }
    ],
    "material_preview": [
      {
        "id": 17,
        "preview": "1712854265493-178954523.epub",
        "material_id": 30,
        "created_at": "2024-04-11T16:51:05.639Z",
        "updated_at": "2024-04-11T16:51:05.639Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 109,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Magazine",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "James Clear",
    "reader": "adoni",
    "translator": "",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "1714549000932-540861356.epub",
    "title": "Tech Hubs",
    "description": "we are the best startup companies to share you our ideas",
    "price": 200,
    "created_at": "2024-05-01T07:35:46.650Z",
    "updated_at": "2024-05-01T07:36:40.939Z",
    "material_image": [
      {
        "id": 82,
        "image": "1714549000932-92256662.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 109,
        "created_at": "2024-05-01T07:36:40.983Z",
        "updated_at": "2024-05-01T07:36:40.983Z"
      },
      {
        "id": 83,
        "image": "1714549000933-172473871.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 109,
        "created_at": "2024-05-01T07:36:40.991Z",
        "updated_at": "2024-05-01T07:36:40.991Z"
      },
      {
        "id": 84,
        "image": "1714549000933-736050907.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 109,
        "created_at": "2024-05-01T07:36:41.008Z",
        "updated_at": "2024-05-01T07:36:41.008Z"
      }
    ],
    "material_preview": [
      {
        "id": 28,
        "preview": "1714549000933-805124565.jpeg",
        "material_id": 109,
        "created_at": "2024-05-01T07:36:40.999Z",
        "updated_at": "2024-05-01T07:36:40.999Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 31,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Book",
    "genere": "Commedy",
    "catagory": "Fiction",
    "author": "Hadddis Alemayehu",
    "reader": "",
    "translator": "Adonias",
    "length_minute": 0,
    "length_page": 408,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Mega Publishers",
    "episode": 0,
    "continues_from": 0,
    "material": "1712854501888-184378671.epub",
    "title": "Love up to Grave",
    "description":
        "Love up to grave is the most loved book ever in the world. So I present the book fo you for very cheap price.",
    "price": 230,
    "created_at": "2024-04-11T16:54:26.273Z",
    "updated_at": "2024-04-11T16:55:01.907Z",
    "material_image": [
      {
        "id": 52,
        "image": "1712854501864-476642534.jpg",
        "primary": true,
        "cover": false,
        "material_id": 31,
        "created_at": "2024-04-11T16:55:01.953Z",
        "updated_at": "2024-04-11T16:55:01.953Z"
      },
      {
        "id": 53,
        "image": "1712854501869-947380130.jpg",
        "primary": false,
        "cover": true,
        "material_id": 31,
        "created_at": "2024-04-11T16:55:01.970Z",
        "updated_at": "2024-04-11T16:55:01.970Z"
      },
      {
        "id": 54,
        "image": "1712854501889-951301860.jpg",
        "primary": false,
        "cover": false,
        "material_id": 31,
        "created_at": "2024-04-11T16:55:01.988Z",
        "updated_at": "2024-04-11T16:55:01.988Z"
      }
    ],
    "material_preview": [
      {
        "id": 18,
        "preview": "1712854501887-726380252.epub",
        "material_id": 31,
        "created_at": "2024-04-11T16:55:01.978Z",
        "updated_at": "2024-04-11T16:55:01.978Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 32,
    "sellerProfile_id": 6,
    "parent": "Audio",
    "type": "Podcast",
    "genere": "Unspecified",
    "catagory": "Unspecified",
    "author": "",
    "reader": "",
    "translator": "",
    "length_minute": 3,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Englsh",
    "publisher": "",
    "episode": 1,
    "continues_from": 0,
    "material": "1712855218744-405295033.mp3",
    "title": "test podcast",
    "description": "testing material descripion",
    "price": 200,
    "created_at": "2024-04-11T17:05:31.302Z",
    "updated_at": "2024-04-11T17:06:58.797Z",
    "material_image": [
      {
        "id": 55,
        "image": "1712855218709-121698698.jpg",
        "primary": true,
        "cover": false,
        "material_id": 32,
        "created_at": "2024-04-11T17:06:58.831Z",
        "updated_at": "2024-04-11T17:06:58.831Z"
      },
      {
        "id": 56,
        "image": "1712855218710-994046428.jpg",
        "primary": false,
        "cover": true,
        "material_id": 32,
        "created_at": "2024-04-11T17:06:58.847Z",
        "updated_at": "2024-04-11T17:06:58.847Z"
      },
      {
        "id": 57,
        "image": "1712855218762-126735802.jpg",
        "primary": false,
        "cover": false,
        "material_id": 32,
        "created_at": "2024-04-11T17:06:58.871Z",
        "updated_at": "2024-04-11T17:06:58.871Z"
      }
    ],
    "material_preview": [
      {
        "id": 19,
        "preview": "1712855218727-693485655.mp3",
        "material_id": 32,
        "created_at": "2024-04-11T17:06:58.862Z",
        "updated_at": "2024-04-11T17:06:58.862Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 33,
    "sellerProfile_id": 6,
    "parent": "Audio",
    "type": "Audiobook",
    "genere": "Unspecified",
    "catagory": "Unspecified",
    "author": "",
    "reader": "Adonia",
    "translator": "",
    "length_minute": 2,
    "length_page": 0,
    "first_published_at": "0",
    "language": "English",
    "publisher": "",
    "episode": 0,
    "continues_from": 0,
    "material": "1712855650137-540288102.mp3",
    "title": "test audio book",
    "description": "testing audio book",
    "price": 250,
    "created_at": "2024-04-11T17:11:36.602Z",
    "updated_at": "2024-04-11T17:14:10.230Z",
    "material_image": [
      {
        "id": 58,
        "image": "1712855650093-482723499.jpg",
        "primary": true,
        "cover": false,
        "material_id": 33,
        "created_at": "2024-04-11T17:14:10.264Z",
        "updated_at": "2024-04-11T17:14:10.264Z"
      },
      {
        "id": 59,
        "image": "1712855650094-790145525.jpg",
        "primary": false,
        "cover": true,
        "material_id": 33,
        "created_at": "2024-04-11T17:14:10.272Z",
        "updated_at": "2024-04-11T17:14:10.272Z"
      },
      {
        "id": 60,
        "image": "1712855650212-711088824.jpg",
        "primary": false,
        "cover": false,
        "material_id": 33,
        "created_at": "2024-04-11T17:14:10.296Z",
        "updated_at": "2024-04-11T17:14:10.296Z"
      }
    ],
    "material_preview": [
      {
        "id": 20,
        "preview": "1712855650112-345901002.mp3",
        "material_id": 33,
        "created_at": "2024-04-11T17:14:10.280Z",
        "updated_at": "2024-04-11T17:14:10.280Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 34,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Book",
    "genere": "Unspecified",
    "catagory": "Unspecified",
    "author": "Adonias",
    "reader": "",
    "translator": "Adonias",
    "length_minute": 0,
    "length_page": 2,
    "first_published_at": "0",
    "language": "English",
    "publisher": "Mega",
    "episode": 0,
    "continues_from": 0,
    "material": "1712855846407-821281962.epub",
    "title": "test boo",
    "description": "test description\n\n\n\n\n\n",
    "price": 100,
    "created_at": "2024-04-11T17:16:15.806Z",
    "updated_at": "2024-04-11T17:17:26.422Z",
    "material_image": [
      {
        "id": 61,
        "image": "1712855846389-742526650.jpg",
        "primary": true,
        "cover": false,
        "material_id": 34,
        "created_at": "2024-04-11T17:17:26.520Z",
        "updated_at": "2024-04-11T17:17:26.520Z"
      },
      {
        "id": 62,
        "image": "1712855846393-268805891.jpg",
        "primary": false,
        "cover": true,
        "material_id": 34,
        "created_at": "2024-04-11T17:17:26.528Z",
        "updated_at": "2024-04-11T17:17:26.528Z"
      },
      {
        "id": 63,
        "image": "1712855846407-515055377.jpg",
        "primary": false,
        "cover": false,
        "material_id": 34,
        "created_at": "2024-04-11T17:17:26.545Z",
        "updated_at": "2024-04-11T17:17:26.545Z"
      }
    ],
    "material_preview": [
      {
        "id": 21,
        "preview": "1712855846407-973812105.epub",
        "material_id": 34,
        "created_at": "2024-04-11T17:17:26.536Z",
        "updated_at": "2024-04-11T17:17:26.536Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  },
  {
    "id": 110,
    "sellerProfile_id": 6,
    "parent": "Publication",
    "type": "Newspaper",
    "genere": "Unspecified",
    "catagory": "Fiction",
    "author": "James Clear",
    "reader": "adoni",
    "translator": "",
    "length_minute": 238,
    "length_page": 0,
    "first_published_at": "0",
    "language": "Amharic",
    "publisher": "Ambasel",
    "episode": 0,
    "continues_from": 1,
    "material": "1714549713370-744284804.epub",
    "title": "Grow Your company",
    "description": "this book will discuss how to Grow Your company",
    "price": 120,
    "created_at": "2024-05-01T07:42:42.864Z",
    "updated_at": "2024-05-01T07:48:33.395Z",
    "material_image": [
      {
        "id": 85,
        "image": "1714549556072-564558323.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 110,
        "created_at": "2024-05-01T07:45:56.121Z",
        "updated_at": "2024-05-01T07:45:56.121Z"
      },
      {
        "id": 86,
        "image": "1714549556082-971289188.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 110,
        "created_at": "2024-05-01T07:45:56.129Z",
        "updated_at": "2024-05-01T07:45:56.129Z"
      },
      {
        "id": 87,
        "image": "1714549556083-56728768.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 110,
        "created_at": "2024-05-01T07:45:56.146Z",
        "updated_at": "2024-05-01T07:45:56.146Z"
      },
      {
        "id": 88,
        "image": "1714549713370-248219045.jpeg",
        "primary": true,
        "cover": false,
        "material_id": 110,
        "created_at": "2024-05-01T07:48:33.430Z",
        "updated_at": "2024-05-01T07:48:33.430Z"
      },
      {
        "id": 89,
        "image": "1714549713370-786502753.jpeg",
        "primary": false,
        "cover": true,
        "material_id": 110,
        "created_at": "2024-05-01T07:48:33.438Z",
        "updated_at": "2024-05-01T07:48:33.438Z"
      },
      {
        "id": 90,
        "image": "1714549713370-109282485.jpeg",
        "primary": false,
        "cover": false,
        "material_id": 110,
        "created_at": "2024-05-01T07:48:33.455Z",
        "updated_at": "2024-05-01T07:48:33.455Z"
      }
    ],
    "material_preview": [
      {
        "id": 29,
        "preview": "1714549556084-769889259.jpeg",
        "material_id": 110,
        "created_at": "2024-05-01T07:45:56.137Z",
        "updated_at": "2024-05-01T07:45:56.137Z"
      },
      {
        "id": 30,
        "preview": "1714549713375-795725119.jpeg",
        "material_id": 110,
        "created_at": "2024-05-01T07:48:33.446Z",
        "updated_at": "2024-05-01T07:48:33.446Z"
      }
    ],
    "material_user": [],
    "rate": [],
    "report": [],
    "SellerProfile": {
      "id": 6,
      "user_id": "aef21272-3ad6-44c5-8a85-ec14fd247331",
      "name": "best seller",
      "sex": "Male",
      "date_of_birth": "2024-04-11 15:44:56.621138",
      "description": "best seller description",
      "image": "1712839534427-671048022.jpg",
      "cover_image": "1712839534451-706164606.jpg",
      "created_at": "2024-04-11T12:45:34.474Z",
      "updated_at": "2024-04-11T12:45:34.474Z"
    }
  }
];

import 'package:amped_media_admin/datamodels/episode_item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const String _apiEndpoint =
      'https://us-central1-thebasics-2f123.cloudfunctions.net/thebasics';

  Future<dynamic> getEpisodes() async {
    var response = await http.get('$_apiEndpoint/courseEpisodes' as Uri);

    if (response.statusCode == 200) {
      var episodes = (json.decode(response.body) as List)
          .map((episode) => EpisodeItemModel.fromJson(episode))
          .toList();
      return episodes;
    }

    // something wrong happened
    return 'Could not fetch the episodes at this time';
  }
}

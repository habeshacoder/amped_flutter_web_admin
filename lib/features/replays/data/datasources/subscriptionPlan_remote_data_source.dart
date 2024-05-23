import 'dart:convert';
import 'package:amped_media_admin/core/error/exceptions.dart';
import '../../../../core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/replay_model.dart';

abstract interface class ReplayRemoteDataSource {
  Future<List<ReplayModel>> getAllReplays();
  Future<String> deleteReplay({required int replayId});
  Future<List<ReplayModel>> searchReplay({
    String? key,
    String? time_from,
    String? time_to,
  });
}

class ReplayRemoteDataSourceImpl implements ReplayRemoteDataSource {
  //delete channel by Id
  @override
  Future<String> deleteReplay({required int replayId}) async {
    try {
      final response = await http.delete(
          Uri.parse('${Urls.deleteReplayUrl}/$replayId'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: json.encode({"replayId": replayId}));
      final extracted = json.decode(response.body);
      return extracted["message"];
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//get all Replays
  @override
  Future<List<ReplayModel>> getAllReplays() async {
    try {
      final response = await http.get(Uri.parse(Urls.getAllReplayUrl),
          headers: <String, String>{'Content-Type': 'application/json'});
      final extracted = json.decode(response.body);

      List<ReplayModel> Replays = [];
      extracted.forEach((mat) {
        print('Replay from remotedatasource:---------------$Replays');

        Replays.add(ReplayModel.fromJson(mat));
      });
      return Replays;
    } catch (error) {
      print('error: $error');
      throw ServerException(error.toString());
    }
  }

//search channel
  @override
  Future<List<ReplayModel>> searchReplay(
      {String? key, String? time_from, String? time_to}) async {
    final response = await http.post(Uri.parse('${Urls.searchReplayUrl}'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "key": key,
          "time_from": time_from,
          "time_to": time_to,
        }));
    List<ReplayModel> searchedReplays = [];
    print(response.body);
    try {
      (json.decode(response.body)["mainMatches"]).forEach((channel) {
        print(searchedReplays);
        searchedReplays.add(ReplayModel.fromJson(channel));
      });
      return searchedReplays;
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}

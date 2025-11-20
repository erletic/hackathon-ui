import 'package:dio/dio.dart';
import '../network/app_http_client.dart';
import '../models/player.dart';

class PlayerService {
  final AppHttpClient _client;

  PlayerService(this._client);

  Future<List<Player>> getPlayersBySearchProfile(String searchProfileId) async {
    try {
      final response = await _client.get(
        '/api/players',
        queryParameters: {'search_profile_id': searchProfileId},
      );
      final data = response.data as List;
      return data
          .map((json) => Player.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException {
      rethrow;
    }
  }

  Future<bool> addToShortList(String playerId) async {
    try {
      final response = await _client.post('/api/players/$playerId/shortlist');
      if (response.statusCode != 200) {
        return false;
      } else {
        return true;
      }
    } on DioException {
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';
import '../network/app_http_client.dart';
import '../models/player.dart';

class PlayerService {
  final AppHttpClient _client;

  PlayerService(this._client);

  Future<List<Player>> getPlayersBySearchProfile(String searchProfileId) async {
    try {
      final response = await _client.get(
        '/api/players/',
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

  Future<bool> addToShortList(String searchProfileId, String playerId) async {
    try {
      final response = await _client.post(
        '/api/search-profiles/$searchProfileId/players/$playerId',
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException {
      rethrow;
    }
  }

  Future<bool> removeFromShortList(
    String searchProfileId,
    String playerId,
  ) async {
    try {
      final response = await _client.delete(
        '/api/search-profiles/$searchProfileId/players/$playerId',
      );
      return response.statusCode == 200 || response.statusCode == 204;
    } on DioException {
      rethrow;
    }
  }

  Future<Player> getPlayerByName(String name) async {
    try {
      final response = await _client.get('/api/players/by-name/$name');
      return Player.fromJson(response.data as Map<String, dynamic>);
    } on DioException {
      rethrow;
    }
  }

  Future<List<Player>> getSimilarPlayers(String playerId) async {
    try {
      final response = await _client.get('/api/players/similar/$playerId');
      final data = response.data as List;
      return data
          .map((json) => Player.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException {
      rethrow;
    }
  }
}

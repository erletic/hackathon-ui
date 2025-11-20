import 'package:dio/dio.dart';
import '../network/app_http_client.dart';
import '../models/search_profile.dart';

class SearchProfileService {
  final AppHttpClient _client;

  SearchProfileService(this._client);

  Future<SearchProfile> getSearchProfile(String id) async {
    try {
      final response = await _client.get(
        '/api/search-profiles',
        queryParameters: {'id': id},
      );
      return SearchProfile.fromJson(response.data as Map<String, dynamic>);
    } on DioException {
      rethrow;
    }
  }

  Future<List<SearchProfile>> getAllSearchProfiles() async {
    try {
      final response = await _client.get('/api/search-profiles');
      final data = response.data as List;
      return data.map((json) => SearchProfile.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException {
      rethrow;
    }
  }

  Future<SearchProfile> createSearchProfile(SearchProfile profile) async {
    try {
      final response = await _client.post(
        '/api/search-profiles',
        data: profile.toJson(),
      );
      return SearchProfile.fromJson(response.data as Map<String, dynamic>);
    } on DioException {
      rethrow;
    }
  }

  Future<SearchProfile> updateSearchProfile(String id, SearchProfile profile) async {
    try {
      final response = await _client.put(
        '/api/search-profiles/$id',
        data: profile.toJson(),
      );
      return SearchProfile.fromJson(response.data as Map<String, dynamic>);
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addPlayerToShortlist(String searchProfileId, int playerId) async {
    try {
      final response = await _client.put(
        '/api/search-profiles/$searchProfileId/players/$playerId',
      );
      return response.data as Map<String, dynamic>;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> removePlayerFromShortlist(String searchProfileId, int playerId) async {
    try {
      final response = await _client.delete(
        '/api/search-profiles/$searchProfileId/players/$playerId',
      );
      return response.data as Map<String, dynamic>;
    } on DioException {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getShortlistedPlayers(String searchProfileId) async {
    try {
      final response = await _client.get(
        '/api/search-profiles/$searchProfileId/players',
      );
      return (response.data as List).cast<Map<String, dynamic>>();
    } on DioException {
      rethrow;
    }
  }
}

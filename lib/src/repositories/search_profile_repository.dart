import 'package:dio/dio.dart';
import '../services/search_profile_service.dart';
import '../models/search_profile.dart';

class SearchProfileRepository {
  final SearchProfileService _service;

  SearchProfileRepository(this._service);

  Future<SearchProfile?> getSearchProfile(String id) async {
    try {
      return await _service.getSearchProfile(id);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<List<SearchProfile>> getAllSearchProfiles() async {
    try {
      return await _service.getAllSearchProfiles();
    } on DioException {
      return [];
    }
  }

  Future<SearchProfile?> createSearchProfile(SearchProfile profile) async {
    try {
      return await _service.createSearchProfile(profile);
    } on DioException {
      return null;
    }
  }

  Future<SearchProfile?> updateSearchProfile(String id, SearchProfile profile) async {
    try {
      return await _service.updateSearchProfile(id, profile);
    } on DioException {
      return null;
    }
  }

  Future<bool> addPlayerToShortlist(String searchProfileId, int playerId) async {
    try {
      final result = await _service.addPlayerToShortlist(searchProfileId, playerId);
      return result['on_shortlist'] == true;
    } on DioException {
      return false;
    }
  }

  Future<bool> removePlayerFromShortlist(String searchProfileId, int playerId) async {
    try {
      final result = await _service.removePlayerFromShortlist(searchProfileId, playerId);
      return result['on_shortlist'] == false;
    } on DioException {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getShortlistedPlayers(String searchProfileId) async {
    try {
      return await _service.getShortlistedPlayers(searchProfileId);
    } on DioException {
      return [];
    }
  }
}

import 'package:dio/dio.dart';
import '../services/player_service.dart';
import '../models/player.dart';

class PlayerRepository {
  final PlayerService _service;

  PlayerRepository(this._service);

  Future<List<Player>> getPlayersBySearchProfile(String searchProfileId) async {
    try {
      return await _service.getPlayersBySearchProfile(searchProfileId);
    } on DioException {
      return [];
    }
  }

  Future<Player?> getPlayerByName(String name) async {
    try {
      return await _service.getPlayerByName(name);
    } on DioException catch (e) {
      // Return null if player not found or error occurs
      if (e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<bool> addToShortList(String searchProfileId, String playerId) async {
    try {
      return await _service.addToShortList(searchProfileId, playerId);
    } on DioException {
      rethrow;
    }
  }

  Future<bool> removeFromShortList(String searchProfileId, String playerId) async {
    try {
      return await _service.removeFromShortList(searchProfileId, playerId);
    } on DioException {
      rethrow;
    }
  }

  Future<List<Player>> getSimilarPlayers(String playerId) async {
    try {
      return await _service.getSimilarPlayers(playerId);
    } on DioException {
      return [];
    }
  }
}

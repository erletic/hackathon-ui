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

  Future<bool> addToShortList(String playerId) async {
    try {
      return await _service.addToShortList(playerId);
    } on DioException {
      rethrow;
    }
  }
}

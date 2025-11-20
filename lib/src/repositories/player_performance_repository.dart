import 'package:dio/dio.dart';
import '../services/player_performance_service.dart';
import '../models/player_performance.dart';

class PlayerPerformanceRepository {
  final PlayerPerformanceService _service;

  PlayerPerformanceRepository(this._service);

  Future<List<PlayerPerformance>> getPlayerPerformances({
    int? playerId,
    int? matchId,
    int? teamId,
    int? competitionId,
    int? seasonId,
    String? dateFrom,
    String? dateTo,
    String? searchProfileId,
  }) async {
    try {
      return await _service.getPlayerPerformances(
        playerId: playerId,
        matchId: matchId,
        teamId: teamId,
        competitionId: competitionId,
        seasonId: seasonId,
        dateFrom: dateFrom,
        dateTo: dateTo,
        searchProfileId: searchProfileId,
      );
    } on DioException {
      return [];
    }
  }
}

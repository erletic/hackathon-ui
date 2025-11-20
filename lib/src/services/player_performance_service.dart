import 'package:dio/dio.dart';
import '../network/app_http_client.dart';
import '../models/player_performance.dart';

class PlayerPerformanceService {
  final AppHttpClient _client;

  PlayerPerformanceService(this._client);

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
      final queryParams = <String, dynamic>{};
      if (playerId != null) queryParams['player_id'] = playerId;
      if (matchId != null) queryParams['match_id'] = matchId;
      if (teamId != null) queryParams['team_id'] = teamId;
      if (competitionId != null) queryParams['competition_id'] = competitionId;
      if (seasonId != null) queryParams['season_id'] = seasonId;
      if (dateFrom != null) queryParams['date_from'] = dateFrom;
      if (dateTo != null) queryParams['date_to'] = dateTo;
      if (searchProfileId != null) queryParams['search_profile_id'] = searchProfileId;

      final response = await _client.get(
        '/api/player-performance',
        queryParameters: queryParams,
      );
      final data = response.data as List;
      return data.map((json) => PlayerPerformance.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException {
      rethrow;
    }
  }
}

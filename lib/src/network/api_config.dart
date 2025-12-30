import 'package:hackathon_ui/src/network/app_http_client.dart';
import 'package:hackathon_ui/src/services/search_profile_service.dart';
import 'package:hackathon_ui/src/services/player_service.dart';
import 'package:hackathon_ui/src/services/player_performance_service.dart';
import 'package:hackathon_ui/src/repositories/search_profile_repository.dart';
import 'package:hackathon_ui/src/repositories/player_repository.dart';
import 'package:hackathon_ui/src/repositories/player_performance_repository.dart';

class ApiConfig {
  static const String baseUrl = 'http://localhost:8080';

  static AppHttpClient? _httpClient;
  static SearchProfileRepository? _searchProfileRepository;
  static PlayerRepository? _playerRepository;
  static PlayerPerformanceRepository? _playerPerformanceRepository;

  static void initialize({String? customBaseUrl}) {
    _httpClient = AppHttpClient(baseUrl: customBaseUrl ?? baseUrl);

    final searchProfileService = SearchProfileService(_httpClient!);
    final playerService = PlayerService(_httpClient!);
    final playerPerformanceService = PlayerPerformanceService(_httpClient!);

    _searchProfileRepository = SearchProfileRepository(searchProfileService);
    _playerRepository = PlayerRepository(playerService);
    _playerPerformanceRepository = PlayerPerformanceRepository(
      playerPerformanceService,
    );
  }

  static AppHttpClient get httpClient {
    if (_httpClient == null) {
      initialize();
    }
    return _httpClient!;
  }

  static SearchProfileRepository get searchProfileRepository {
    if (_searchProfileRepository == null) {
      initialize();
    }
    return _searchProfileRepository!;
  }

  static PlayerRepository get playerRepository {
    if (_playerRepository == null) {
      initialize();
    }
    return _playerRepository!;
  }

  static PlayerPerformanceRepository get playerPerformanceRepository {
    if (_playerPerformanceRepository == null) {
      initialize();
    }
    return _playerPerformanceRepository!;
  }
}

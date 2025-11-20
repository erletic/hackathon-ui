import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/app_http_client.dart';
import '../services/search_profile_service.dart';
import '../services/player_service.dart';
import '../services/player_performance_service.dart';
import '../repositories/search_profile_repository.dart';
import '../repositories/player_repository.dart';
import '../repositories/player_performance_repository.dart';

final httpClientProvider = Provider<AppHttpClient>((ref) {
  return AppHttpClient(baseUrl: 'http://localhost:3000');
});

final searchProfileServiceProvider = Provider<SearchProfileService>((ref) {
  return SearchProfileService(ref.read(httpClientProvider));
});

final playerServiceProvider = Provider<PlayerService>((ref) {
  return PlayerService(ref.read(httpClientProvider));
});

final playerPerformanceServiceProvider = Provider<PlayerPerformanceService>((ref) {
  return PlayerPerformanceService(ref.read(httpClientProvider));
});

final searchProfileRepositoryProvider = Provider<SearchProfileRepository>((ref) {
  return SearchProfileRepository(ref.read(searchProfileServiceProvider));
});

final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return PlayerRepository(ref.read(playerServiceProvider));
});

final playerPerformanceRepositoryProvider = Provider<PlayerPerformanceRepository>((ref) {
  return PlayerPerformanceRepository(ref.read(playerPerformanceServiceProvider));
});

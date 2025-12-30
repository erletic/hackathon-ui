import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/player.dart';
import 'api_providers.dart';
import 'search_profile_providers.dart';

final playersProvider = FutureProvider<List<Player>>((ref) async {
  final selectedProfile = ref.watch(selectedSearchProfileProvider);

  if (selectedProfile == null) {
    return [];
  }

  final repository = ref.read(playerRepositoryProvider);
  return await repository.getPlayersBySearchProfile(selectedProfile.toString());
});

final selectedPlayerProvider = StateProvider<Player?>((ref) => null);

/// Holds the last player found via name search (keeps it independent from card selection).
final searchedPlayerProvider = StateProvider<Player?>((ref) => null);

/// Function to search for a player by name and update searchedPlayerProvider
Future<void> searchPlayerByName(WidgetRef ref, String name) async {
  final repository = ref.read(playerRepositoryProvider);
  final player = await repository.getPlayerByName(name);
  ref.read(searchedPlayerProvider.notifier).state = player;
}

/// Provider for similar players based on the searched player
final similarPlayersProvider = FutureProvider<List<Player>>((ref) async {
  final searchedPlayer = ref.watch(searchedPlayerProvider);

  if (searchedPlayer == null) {
    return [];
  }

  final repository = ref.read(playerRepositoryProvider);
  return await repository.getSimilarPlayers(searchedPlayer.playerId.toString());
});

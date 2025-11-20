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

final shortlistProvider =
    StateNotifierProvider<ShortlistNotifier, List<Player>>((ref) {
      return ShortlistNotifier(ref);
    });

class ShortlistNotifier extends StateNotifier<List<Player>> {
  final Ref _ref;

  ShortlistNotifier(this._ref) : super([]);

  Future<void> addToShortlist(Player player) async {
    final repository = _ref.read(playerRepositoryProvider);

    try {
      final success = await repository.addToShortList(
        player.playerId.toString(),
      );

      if (success) {
        // Add player to local state if not already present
        if (!state.any((p) => p.playerId == player.playerId)) {
          state = [...state, player];
        }
      }
    } catch (e) {
      // Handle error - could throw or just fail silently
      rethrow;
    }
  }

  void removeFromShortlist(int playerId) {
    state = state.where((p) => p.playerId != playerId).toList();
  }

  void clearShortlist() {
    state = [];
  }
}

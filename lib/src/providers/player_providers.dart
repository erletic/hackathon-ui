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

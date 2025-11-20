import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/search_profile.dart';
import '../models/player.dart';
import '../data/mock_data.dart';

final mockSearchProfilesProvider = FutureProvider<List<SearchProfile>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
  return MockData.getSearchProfiles();
});

final mockSelectedSearchProfileIndexProvider = StateProvider<int>((ref) => 0);

final mockSelectedSearchProfileProvider = Provider<SearchProfile?>((ref) {
  final profiles = ref.watch(mockSearchProfilesProvider);
  final selectedIndex = ref.watch(mockSelectedSearchProfileIndexProvider);

  return profiles.when(
    data: (data) => data.isNotEmpty && selectedIndex < data.length
        ? data[selectedIndex]
        : null,
    loading: () => null,
    error: (_, __) => null,
  );
});

final mockPlayersProvider = FutureProvider<List<Player>>((ref) async {
  final selectedProfile = ref.watch(mockSelectedSearchProfileProvider);

  if (selectedProfile == null) {
    return [];
  }

  await Future.delayed(const Duration(milliseconds: 300));

  final allPlayers = MockData.getPlayers();

  if (selectedProfile.position == 'CF') {
    return allPlayers.sublist(0, 6);
  } else if (selectedProfile.position == 'CM') {
    return allPlayers.sublist(5, 11);
  } else if (selectedProfile.position == 'CB') {
    return allPlayers.sublist(3, 9);
  }

  return allPlayers;
});

final mockSelectedPlayerProvider = StateProvider<Player?>((ref) => null);

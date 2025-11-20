import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/search_profile.dart';
import 'api_providers.dart';

final searchProfilesProvider = FutureProvider<List<SearchProfile>>((ref) async {
  final repository = ref.read(searchProfileRepositoryProvider);
  return await repository.getAllSearchProfiles();
});

final selectedSearchProfileIndexProvider = StateProvider<int>((ref) => 0);

final selectedSearchProfileProvider = Provider<SearchProfile?>((ref) {
  final profiles = ref.watch(searchProfilesProvider);
  final selectedIndex = ref.watch(selectedSearchProfileIndexProvider);

  return profiles.when(
    data: (data) => data.isNotEmpty && selectedIndex < data.length
        ? data[selectedIndex]
        : null,
    loading: () => null,
    error: (_, __) => null,
  );
});

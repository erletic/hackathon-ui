import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../providers/api_providers.dart';
import '../providers/search_profile_providers.dart';
import '../providers/player_providers.dart';
import '../providers/mock_providers.dart';
import '../data/mock_data.dart';
import '../models/player.dart';
import '../widgets/player_card.dart';
import '../widgets/player_detail_view.dart';
import 'tactics_screen.dart';
import 'create_search_profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProfiles = AppConfig.useMockData
        ? ref.watch(mockSearchProfilesProvider)
        : ref.watch(searchProfilesProvider);
    final selectedIndex = AppConfig.useMockData
        ? ref.watch(mockSelectedSearchProfileIndexProvider)
        : ref.watch(selectedSearchProfileIndexProvider);
    final players = AppConfig.useMockData
        ? ref.watch(mockPlayersProvider)
        : ref.watch(playersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Scout'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_search),
            onPressed: () => _openPlayerSearchDialog(context, ref),
            tooltip: 'Spieler nach Name suchen',
          ),
          IconButton(
            icon: const Icon(Icons.sports_soccer),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TacticsScreen()),
              );
            },
            tooltip: 'Tactics & Formation',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 900;

          return searchProfiles.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: $error'),
                ],
              ),
            ),
            data: (profiles) {
              if (profiles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off, size: 48),
                      const SizedBox(height: 16),
                      const Text('No search profiles found'),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CreateSearchProfileScreen(),
                            ),
                          );
                          if (result != null && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Search profile created successfully',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Create Search Profile'),
                      ),
                    ],
                  ),
                );
              }

              if (isDesktop) {
                return Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: _buildPlayerGrid(
                        context,
                        ref,
                        profiles,
                        selectedIndex,
                        players,
                      ),
                    ),
                    const VerticalDivider(width: 1),
                    const Expanded(flex: 4, child: PlayerDetailView()),
                  ],
                );
              } else {
                return _buildPlayerGrid(
                  context,
                  ref,
                  profiles,
                  selectedIndex,
                  players,
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildPlayerGrid(
    BuildContext context,
    WidgetRef ref,
    List profiles,
    int selectedIndex,
    AsyncValue players,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Neue Suche starten'),
                onPressed: () => _openPlayerSearchDialog(context, ref),
              ),
              if (profiles.isNotEmpty) ...[
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int index = 0; index < profiles.length; index++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onLongPress: () async {
                              final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CreateSearchProfileScreen(
                                        existingProfile: profiles[index],
                                      ),
                                ),
                              );
                              if (result != null && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Search profile updated successfully',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            },
                            child: ChoiceChip(
                              label: Text(
                                profiles[index].position ??
                                    profiles[index].positionGroup ??
                                    'Profile ${index + 1}',
                              ),
                              selected: index == selectedIndex,
                              onSelected: (selected) {
                                if (selected) {
                                  if (AppConfig.useMockData) {
                                    ref
                                            .read(
                                              mockSelectedSearchProfileIndexProvider
                                                  .notifier,
                                            )
                                            .state =
                                        index;
                                    ref
                                            .read(
                                              mockSelectedPlayerProvider
                                                  .notifier,
                                            )
                                            .state =
                                        null;
                                  } else {
                                    ref
                                            .read(
                                              selectedSearchProfileIndexProvider
                                                  .notifier,
                                            )
                                            .state =
                                        index;
                                    ref
                                            .read(
                                              selectedPlayerProvider.notifier,
                                            )
                                            .state =
                                        null;
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
          child: _buildSearchedPlayerSummary(context, ref),
        ),

        Expanded(
          child: players.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading players: $error'),
                ],
              ),
            ),
            data: (playerList) {
              if (playerList.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_off, size: 48),
                      SizedBox(height: 16),
                      Text('No players found for this search profile'),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: playerList.length,
                itemBuilder: (context, index) {
                  final player = playerList[index];
                  final selectedPlayer = AppConfig.useMockData
                      ? ref.watch(mockSelectedPlayerProvider)
                      : ref.watch(selectedPlayerProvider);
                  final isSelected =
                      selectedPlayer?.playerId == player.playerId;

                  return PlayerCard(
                    player: player,
                    isSelected: isSelected,
                    onTap: () {
                      if (AppConfig.useMockData) {
                        ref.read(mockSelectedPlayerProvider.notifier).state =
                            player;
                      } else {
                        ref.read(selectedPlayerProvider.notifier).state =
                            player;
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _openPlayerSearchDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Spieler suchen'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'z.B. Jude Bellingham',
          ),
          onSubmitted: (value) => Navigator.of(dialogContext).pop(value.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.of(dialogContext).pop(controller.text.trim()),
            child: const Text('Suchen'),
          ),
        ],
      ),
    );

    if (name == null || name.isEmpty) return;
    if (!context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();

    try {
      Player? player;

      if (AppConfig.useMockData) {
        player = _findMockPlayerByName(name);
      } else {
        final repository = ref.read(playerRepositoryProvider);
        player = await repository.getPlayerByName(name);
      }

      if (player == null) {
        messenger.showSnackBar(
          const SnackBar(content: Text('Kein Spieler gefunden')),
        );
        return;
      }

      ref.read(searchedPlayerProvider.notifier).state = player;

      messenger.showSnackBar(
        SnackBar(
          content: Text('Gefunden: ${player.name}'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Fehler bei der Spielersuche'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildInfoChip(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.surfaceContainerHighest.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.outlineVariant.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: color.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.labelSmall?.copyWith(color: color.onSurface),
          ),
        ],
      ),
    );
  }

  Player? _findMockPlayerByName(String name) {
    final lower = name.toLowerCase();
    final players = MockData.getPlayers();

    for (final player in players) {
      if (player.name.toLowerCase() == lower ||
          player.shortName.toLowerCase() == lower) {
        return player;
      }
    }

    for (final player in players) {
      if (player.name.toLowerCase().contains(lower) ||
          player.shortName.toLowerCase().contains(lower)) {
        return player;
      }
    }

    return null;
  }

  Widget _buildSearchedPlayerSummary(BuildContext context, WidgetRef ref) {
    final player = ref.watch(searchedPlayerProvider);
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    if (player == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.outlineVariant.withOpacity(0.5)),
        ),
        child: Text(
          'Gefundener Spieler erscheint hier (nicht mit Auswahl synchronisiert).',
          style: theme.textTheme.bodySmall?.copyWith(
            color: color.onSurfaceVariant,
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.outlineVariant.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gefundener Spieler',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            player.name,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 10,
            runSpacing: 6,
            children: [
              _buildInfoChip(context, 'Kurzname', player.shortName),
              _buildInfoChip(context, 'Player ID', player.playerId.toString()),
              _buildInfoChip(context, 'Team ID', player.teamId.toString()),
              _buildInfoChip(context, 'Geburtstag', player.birthdate),
            ],
          ),
        ],
      ),
    );
  }
}

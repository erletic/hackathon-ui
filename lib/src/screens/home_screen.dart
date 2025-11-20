import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../providers/search_profile_providers.dart';
import '../providers/player_providers.dart';
import '../providers/mock_providers.dart';
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
            icon: const Icon(Icons.sports_soccer),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TacticsScreen(),
                ),
              );
            },
            tooltip: 'Tactics & Formation',
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateSearchProfileScreen(),
                ),
              );
              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Search profile created successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            tooltip: 'Create Search Profile',
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
                              builder: (context) => const CreateSearchProfileScreen(),
                            ),
                          );
                          if (result != null && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Search profile created successfully'),
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
                    const Expanded(
                      flex: 4,
                      child: PlayerDetailView(),
                    ),
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
        if (profiles.length > 1)
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                final isSelected = index == selectedIndex;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onLongPress: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreateSearchProfileScreen(
                            existingProfile: profile,
                          ),
                        ),
                      );
                      if (result != null && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Search profile updated successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: ChoiceChip(
                      label: Text(
                        profile.position ?? profile.positionGroup ?? 'Profile ${index + 1}',
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          if (AppConfig.useMockData) {
                            ref.read(mockSelectedSearchProfileIndexProvider.notifier).state = index;
                            ref.read(mockSelectedPlayerProvider.notifier).state = null;
                          } else {
                            ref.read(selectedSearchProfileIndexProvider.notifier).state = index;
                            ref.read(selectedPlayerProvider.notifier).state = null;
                          }
                        }
                      },
                    ),
                  ),
                );
              },
            ),
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
                  final isSelected = selectedPlayer?.playerId == player.playerId;

                  return PlayerCard(
                    player: player,
                    isSelected: isSelected,
                    onTap: () {
                      if (AppConfig.useMockData) {
                        ref.read(mockSelectedPlayerProvider.notifier).state = player;
                      } else {
                        ref.read(selectedPlayerProvider.notifier).state = player;
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
}

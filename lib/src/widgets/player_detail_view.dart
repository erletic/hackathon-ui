import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

import '../config/app_config.dart';
import '../providers/player_providers.dart';
import '../providers/mock_providers.dart';
import '../providers/search_profile_providers.dart';
import '../providers/api_providers.dart';
import '../models/player.dart';

class PlayerDetailView extends ConsumerWidget {
  final Player? basePlayer;

  const PlayerDetailView({super.key, this.basePlayer});

  int _calculateAge(String birthdate) {
    final birth = DateTime.parse(birthdate);
    final today = DateTime.now();
    int age = today.year - birth.year;
    if (today.month < birth.month ||
        (today.month == birth.month && today.day < birth.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlayer = AppConfig.useMockData
        ? ref.watch(mockSelectedPlayerProvider)
        : ref.watch(selectedPlayerProvider);

    if (selectedPlayer == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_search,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'Select a player to view details',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    final age = _calculateAge(selectedPlayer.birthdate);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Get current search profile to check favorites
    final searchProfiles = AppConfig.useMockData
        ? ref.watch(mockSearchProfilesProvider)
        : ref.watch(searchProfilesProvider);
    final selectedProfileIndex = AppConfig.useMockData
        ? ref.watch(mockSelectedSearchProfileIndexProvider)
        : ref.watch(selectedSearchProfileIndexProvider);

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: colorScheme.outlineVariant.withOpacity(0.4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundColor: colorScheme.primaryContainer,
                          backgroundImage:
                              selectedPlayer.imgurl != null &&
                                  selectedPlayer.imgurl!.isNotEmpty
                              ? NetworkImage(selectedPlayer.imgurl!)
                              : null,
                          onBackgroundImageError:
                              selectedPlayer.imgurl != null &&
                                  selectedPlayer.imgurl!.isNotEmpty
                              ? (exception, stackTrace) {}
                              : null,
                          child:
                              selectedPlayer.imgurl == null ||
                                  selectedPlayer.imgurl!.isEmpty
                              ? Icon(
                                  Icons.person,
                                  size: 48,
                                  color: colorScheme.onPrimaryContainer,
                                )
                              : null,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedPlayer.name,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Age $age • Player ID ${selectedPlayer.playerId}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        searchProfiles.when(
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                          data: (profiles) {
                            if (profiles.isEmpty ||
                                selectedProfileIndex < 0 ||
                                selectedProfileIndex >= profiles.length) {
                              return const SizedBox.shrink();
                            }

                            final currentProfile =
                                profiles[selectedProfileIndex];
                            final favoritePlayers =
                                currentProfile
                                    .performanceFilters
                                    ?.favoritePlayers ??
                                [];
                            final isFavorite = favoritePlayers.contains(
                              selectedPlayer.playerId,
                            );

                            return FilledButton.icon(
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                backgroundColor: isFavorite
                                    ? colorScheme.tertiary
                                    : colorScheme.primary,
                              ),
                              onPressed: () async {
                                if (AppConfig.useMockData) {
                                  // Mock data - show message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        isFavorite
                                            ? 'Removed from favorites (mock)'
                                            : 'Added to favorites (mock)',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                final searchProfileId = currentProfile.id
                                    ?.toString();
                                if (searchProfileId == null) return;

                                final repository = ref.read(
                                  playerRepositoryProvider,
                                );
                                final playerId = selectedPlayer.playerId
                                    .toString();

                                try {
                                  if (isFavorite) {
                                    await repository.removeFromShortList(
                                      searchProfileId,
                                      playerId,
                                    );
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Von Beobachtungsliste entfernt',
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    await repository.addToShortList(
                                      searchProfileId,
                                      playerId,
                                    );
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Zur Beobachtungsliste hinzugefügt',
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    }
                                  }
                                  // Refresh search profiles to update favorites
                                  ref.invalidate(searchProfilesProvider);
                                } catch (e) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Fehler: $e'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                              icon: Icon(
                                isFavorite ? Icons.star : Icons.star_border,
                              ),
                              label: Text(
                                isFavorite ? 'Beobachtet' : 'Beobachten',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 800;

                    if (isWide) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _buildInfoSection(
                              context,
                              title: 'Information',
                              children: [
                                _buildInfoRow(
                                  context,
                                  'Birthdate',
                                  selectedPlayer.birthdate,
                                ),
                                _buildInfoRow(context, 'Age', '$age years'),
                                _buildInfoRow(
                                  context,
                                  'Player ID',
                                  selectedPlayer.playerId.toString(),
                                ),
                                _buildInfoRow(
                                  context,
                                  'Team Name',
                                  selectedPlayer.teamName,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: _buildLineChart(
                              context,
                              selectedPlayer.name,
                            ),
                          ),
                        ],
                      );
                    }

                    // Mobile / schmal: untereinander
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoSection(
                          context,
                          title: 'Player Information',
                          children: [
                            _buildInfoRow(
                              context,
                              'Birthdate',
                              selectedPlayer.birthdate,
                            ),
                            _buildInfoRow(context, 'Age', '$age years'),
                            _buildInfoRow(
                              context,
                              'Player ID',
                              selectedPlayer.playerId.toString(),
                            ),
                            _buildInfoRow(
                              context,
                              'Team Name',
                              selectedPlayer.teamName,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildLineChart(context, selectedPlayer.name),
                        if (selectedPlayer.distance != null) ...[
                          const SizedBox(height: 24),
                          _buildPerformanceStats(context, selectedPlayer),
                        ],
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPerformanceStats(BuildContext context, dynamic player) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance Statistics',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                'Distance',
                '${player.distance?.toStringAsFixed(0) ?? 'N/A'} m',
                Icons.straighten,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                context,
                'Speed',
                '${player.metersPerMinute?.toStringAsFixed(1) ?? 'N/A'} m/min',
                Icons.speed,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                'Sprint Distance',
                '${player.sprintDistance?.toStringAsFixed(0) ?? 'N/A'} m',
                Icons.directions_run,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                context,
                'HSR Distance',
                '${player.hsrDistance?.toStringAsFixed(0) ?? 'N/A'} m',
                Icons.flash_on,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                'High Acc',
                '${player.highAccelerationCount ?? 'N/A'}',
                Icons.trending_up,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                context,
                'High Dec',
                '${player.highDecelerationCount ?? 'N/A'}',
                Icons.trending_down,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: colorScheme.outlineVariant.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(children: [...children]),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, double> _normalizeAttributes(dynamic player) {
    // Normalization ranges (based on typical professional player values)
    final normalizations = {
      'Speed (m/min)': {'value': player.metersPerMinute, 'max': 150.0},
      'Sprint Dist': {'value': player.sprintDistance, 'max': 300.0},
      'HSR Dist': {'value': player.hsrDistance, 'max': 1500.0},
      'Running Dist': {'value': player.runningDistance, 'max': 3000.0},
      'HI Intensity': {'value': player.hiDistance, 'max': 1500.0},
      'Acceleration': {
        'value': player.highAccelerationCount?.toDouble(),
        'max': 30.0,
      },
      'Deceleration': {
        'value': player.highDecelerationCount?.toDouble(),
        'max': 50.0,
      },
      'Explosiveness': {
        'value': player.explosiveAccToSprintCount?.toDouble(),
        'max': 10.0,
      },
    };

    final result = <String, double>{};
    normalizations.forEach((key, data) {
      final value = data['value'];
      final max = data['max'] as double;
      if (value != null && value is num) {
        result[key] = ((value / max) * 100).clamp(0.0, 100.0);
      } else {
        result[key] = 0.0;
      }
    });

    return result;
  }

  Widget _buildLineChart(BuildContext context, String playerName) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Physical Attributes',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorScheme.outlineVariant.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Consumer(
              builder: (context, ref, child) {
                final player = AppConfig.useMockData
                    ? ref.watch(mockSelectedPlayerProvider)
                    : ref.watch(selectedPlayerProvider);

                if (player == null) {
                  return const SizedBox(
                    height: 300,
                    child: Center(child: Text('No player selected')),
                  );
                }

                final attributes = _normalizeAttributes(player);
                final baseAttributes = basePlayer != null
                    ? _normalizeAttributes(basePlayer!)
                    : null;

                // Build data sets - base player first (if exists), then selected player
                final dataSets = <RadarDataSet>[];

                if (baseAttributes != null) {
                  dataSets.add(
                    RadarDataSet(
                      fillColor: colorScheme.tertiary.withOpacity(0.15),
                      borderColor: colorScheme.tertiary,
                      borderWidth: 2,
                      dataEntries: baseAttributes.values
                          .map((value) => RadarEntry(value: value))
                          .toList(),
                    ),
                  );
                }

                dataSets.add(
                  RadarDataSet(
                    fillColor: colorScheme.primary.withOpacity(0.2),
                    borderColor: colorScheme.primary,
                    borderWidth: 2,
                    dataEntries: attributes.values
                        .map((value) => RadarEntry(value: value))
                        .toList(),
                  ),
                );

                return Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: RadarChart(
                        RadarChartData(
                          radarShape: RadarShape.polygon,
                          radarBorderData: BorderSide(
                            color: colorScheme.outline.withOpacity(0.3),
                            width: 1,
                          ),
                          gridBorderData: BorderSide(
                            color: colorScheme.outlineVariant.withOpacity(0.2),
                            width: 1,
                          ),
                          tickCount: 5,
                          ticksTextStyle: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 10,
                          ),
                          tickBorderData: BorderSide(
                            color: colorScheme.outlineVariant.withOpacity(0.1),
                          ),
                          getTitle: (index, angle) {
                            final labels = attributes.keys.toList();
                            if (index >= labels.length)
                              return const RadarChartTitle(text: '');

                            // Normalize angle to keep text readable (never upside down)
                            double adjustedAngle = angle;
                            if (angle > 90 && angle < 270) {
                              adjustedAngle = angle + 180;
                            }

                            return RadarChartTitle(
                              text: labels[index],
                              angle: adjustedAngle,
                            );
                          },
                          titleTextStyle: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                          dataSets: dataSets,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (basePlayer != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: colorScheme.tertiary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            basePlayer!.shortName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            player.shortName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: attributes.entries.map((entry) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${entry.key}: ${entry.value.toStringAsFixed(0)}',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
